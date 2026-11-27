// Copyright (c) 2026 Contributors to the Suwayomi project

import 'package:flutter_test/flutter_test.dart';
import 'package:gql/language.dart';
import 'package:graphql/client.dart';
import 'package:tachidesk_sorayomi/src/constants/enum.dart';
import 'package:tachidesk_sorayomi/src/features/auth/data/auth_coordinator.dart';
import 'package:tachidesk_sorayomi/src/features/auth/data/suwayomi_auth_link.dart';

/// Records each downstream request and lets the test script the responses
/// it returns. The next-in-link, after the SuwayomiAuthLink.
class _RecorderLink extends Link {
  _RecorderLink(this.responses);
  final List<Response Function(Request)> responses;
  int callCount = 0;
  final List<Request> received = [];

  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    received.add(request);
    final fn = responses[callCount.clamp(0, responses.length - 1)];
    callCount++;
    yield fn(request);
  }
}

/// Like `_RecorderLink` but emits multiple events for a single request —
/// used to verify subscription-style streams aren't truncated by the
/// auth link's first-event inspection.
class _MultiEventLink extends Link {
  _MultiEventLink(this.events);
  final List<Response> events;
  int callCount = 0;

  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    callCount++;
    for (final e in events) {
      yield e;
    }
  }
}

Response _ok() => Response(data: {'ok': true}, response: {});

Response _401() => Response(
      data: null,
      errors: [
        const GraphQLError(message: 'Unauthorized', extensions: {
          'http': {'status': 401},
        }),
      ],
      response: {},
    );

Request _req() => Request(
      operation: Operation(document: parseString('query Q { x }')),
    );

void main() {
  group('SuwayomiAuthLink — UI Login', () {
    test('injects Authorization: Bearer header from store', () async {
      final recorder = _RecorderLink([(_) => _ok()]);
      String? lastAuth;
      final link = SuwayomiAuthLink(
        authType: () => AuthType.uiLogin,
        getHeaders: () async => {'Authorization': 'Bearer TOK'},
        refreshAccessToken: () async => const RefreshAuthFailure(),
        onNeedsReauth: () {},
      );

      await for (final _ in link.concat(recorder).request(_req())) {}

      lastAuth = recorder.received.last.context
          .entry<HttpLinkHeaders>()
          ?.headers['Authorization'];
      expect(lastAuth, 'Bearer TOK');
    });

    test('on 401, calls refresh and retries with new token (header asserts'
        ' the retry uses FRESH, not STALE — R2-9)', () async {
      int refreshCalls = 0;
      final recorder = _RecorderLink([
        (_) => _401(), // first call: 401
        (_) => _ok(), // second call (after refresh): ok
      ]);
      final link = SuwayomiAuthLink(
        authType: () => AuthType.uiLogin,
        getHeaders: () async => {'Authorization': 'Bearer STALE'},
        refreshAccessToken: () async {
          refreshCalls++;
          return const RefreshSuccess('FRESH');
        },
        onNeedsReauth: () {},
      );

      Response? lastResponse;
      await for (final r in link.concat(recorder).request(_req())) {
        lastResponse = r;
      }

      expect(refreshCalls, 1);
      expect(recorder.callCount, 2);
      expect(lastResponse?.data, {'ok': true});
      // R2-9: the retried request MUST use the fresh token, not the stale
      // one. A broken implementation that retried with STALE would pass
      // the previous version of this test because the second scripted
      // response is _ok() regardless of header.
      expect(
        recorder.received[0].context.entry<HttpLinkHeaders>()?.headers[
            'Authorization'],
        'Bearer STALE',
        reason: 'first request uses the stale token before refresh',
      );
      expect(
        recorder.received[1].context.entry<HttpLinkHeaders>()?.headers[
            'Authorization'],
        'Bearer FRESH',
        reason: 'second request MUST use the freshly-refreshed token',
      );
    });

    test('R2-4: retry also returns 401 → onNeedsReauth + surface 401',
        () async {
      bool reauthCalled = false;
      final recorder = _RecorderLink([
        (_) => _401(), // first call
        (_) => _401(), // retry with FRESH token also 401
      ]);
      final link = SuwayomiAuthLink(
        authType: () => AuthType.uiLogin,
        getHeaders: () async => {'Authorization': 'Bearer STALE'},
        refreshAccessToken: () async => const RefreshSuccess('FRESH'),
        onNeedsReauth: () {
          reauthCalled = true;
        },
      );

      Response? lastResponse;
      await for (final r in link.concat(recorder).request(_req())) {
        lastResponse = r;
      }

      expect(reauthCalled, isTrue,
          reason: 'second 401 after a fresh token must trigger reauth');
      expect(recorder.callCount, 2);
      expect(lastResponse?.errors?.first.message, 'Unauthorized');
    });

    test('transientFailure surfaces original 401 without setting reauth',
        () async {
      bool reauthCalled = false;
      final recorder = _RecorderLink([(_) => _401()]);
      final link = SuwayomiAuthLink(
        authType: () => AuthType.uiLogin,
        getHeaders: () async => {'Authorization': 'Bearer STALE'},
        refreshAccessToken: () async =>
            RefreshOutcome.transientFailure(Exception('network down')),
        onNeedsReauth: () {
          reauthCalled = true;
        },
      );

      Response? lastResponse;
      await for (final r in link.concat(recorder).request(_req())) {
        lastResponse = r;
      }

      expect(reauthCalled, isFalse,
          reason: 'transient (network) refresh failure must NOT mark '
              'the session dead — the refresh token may still be good');
      expect(lastResponse?.errors?.first.message, 'Unauthorized');
    });

    test('does NOT truncate multi-event streams (subscriptions): all '
        'downstream events flow through', () async {
      final downstream = _MultiEventLink([
        Response(data: {'tick': 1}, response: {}),
        Response(data: {'tick': 2}, response: {}),
        Response(data: {'tick': 3}, response: {}),
      ]);
      final link = SuwayomiAuthLink(
        authType: () => AuthType.uiLogin,
        getHeaders: () async => {'Authorization': 'Bearer TOK'},
        refreshAccessToken: () async => const RefreshAuthFailure(),
        onNeedsReauth: () {},
      );

      final results = <Response>[];
      await for (final r in link.concat(downstream).request(_req())) {
        results.add(r);
      }
      expect(results.length, 3,
          reason: 'subscription stream truncated — likely '
              'await stream.first regression');
      expect(results.map((r) => r.data?['tick']).toList(), [1, 2, 3]);
    });

    test('on 401 with auth-failure refresh, calls onNeedsReauth and '
        'returns the 401', () async {
      bool reauthCalled = false;
      final recorder = _RecorderLink([(_) => _401()]);
      final link = SuwayomiAuthLink(
        authType: () => AuthType.uiLogin,
        getHeaders: () async => {'Authorization': 'Bearer STALE'},
        refreshAccessToken: () async => const RefreshAuthFailure(),
        onNeedsReauth: () {
          reauthCalled = true;
        },
      );

      Response? lastResponse;
      await for (final r in link.concat(recorder).request(_req())) {
        lastResponse = r;
      }

      expect(reauthCalled, isTrue);
      expect(lastResponse?.errors?.first.message, 'Unauthorized');
    });

    // Note: process-wide single-flight is now an AuthCoordinator concern,
    // not the Link's (R2-3). See AuthCoordinator tests for the dedup
    // assertion; the Link itself just calls `refreshAccessToken` once per
    // 401 it sees, and trusts the coordinator to handle concurrency.
    test('R2-3: Link delegates refresh; one 401 → exactly one refresh call',
        () async {
      int refreshCalls = 0;
      final recorder = _RecorderLink([(_) => _401(), (_) => _ok()]);
      final link = SuwayomiAuthLink(
        authType: () => AuthType.uiLogin,
        getHeaders: () async => {'Authorization': 'Bearer STALE'},
        refreshAccessToken: () async {
          refreshCalls++;
          return const RefreshSuccess('FRESH');
        },
        onNeedsReauth: () {},
      );

      await for (final _ in link.concat(recorder).request(_req())) {}

      expect(refreshCalls, 1,
          reason: 'Link should invoke refreshAccessToken exactly once '
              'per 401 — coordinator dedup is its own concern');
    });
  });

  group('SuwayomiAuthLink — Simple Login', () {
    test('injects Cookie header from store', () async {
      final recorder = _RecorderLink([(_) => _ok()]);
      final link = SuwayomiAuthLink(
        authType: () => AuthType.simpleLogin,
        getHeaders: () async => {'Cookie': 'JSESSIONID=abc'},
        refreshAccessToken: () async => const RefreshAuthFailure(),
        onNeedsReauth: () {},
      );

      await for (final _ in link.concat(recorder).request(_req())) {}

      final cookie = recorder.received.last.context
          .entry<HttpLinkHeaders>()
          ?.headers['Cookie'];
      expect(cookie, 'JSESSIONID=abc');
    });

    test('on 401, calls onNeedsReauth (no refresh path)', () async {
      bool reauthCalled = false;
      final recorder = _RecorderLink([(_) => _401()]);
      final link = SuwayomiAuthLink(
        authType: () => AuthType.simpleLogin,
        getHeaders: () async => {'Cookie': 'JSESSIONID=stale'},
        refreshAccessToken: () async => const RefreshAuthFailure(),
        onNeedsReauth: () {
          reauthCalled = true;
        },
      );

      await for (final _ in link.concat(recorder).request(_req())) {}

      expect(reauthCalled, isTrue);
    });
  });
}
