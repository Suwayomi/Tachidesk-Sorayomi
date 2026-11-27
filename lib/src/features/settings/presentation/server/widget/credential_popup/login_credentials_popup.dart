// Copyright (c) 2026 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../constants/db_keys.dart';
import '../../../../../../constants/endpoints.dart';
import '../../../../../../constants/enum.dart';
import '../../../../../../features/auth/data/auth_coordinator.dart';
import '../../../../../../features/auth/data/auth_credentials_store.dart';
import '../../../../../../global_providers/global_providers.dart';
import '../../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../../utils/mixin/shared_preferences_client_mixin.dart';
import '../../../../../../widgets/popup_widgets/pop_button.dart';
import '../client/server_port_tile/server_port_tile.dart';
import '../client/server_url_tile/server_url_tile.dart';

part 'login_credentials_popup.g.dart';

@riverpod
class AuthUsername extends _$AuthUsername
    with SharedPreferenceClientMixin<String> {
  @override
  String? build() => initialize(DBKeys.authUsername);
}

class LoginCredentialsPopup extends HookConsumerWidget {
  const LoginCredentialsPopup({super.key, required this.authType});

  final AuthType authType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final username = useTextEditingController(
      text: ref.read(authUsernameProvider) ?? '',
    );
    final password = useTextEditingController();
    final testing = useState(false);
    final testResult = useState<String?>(null);
    final testResultIsError = useState(false);

    Future<bool> confirmInsecureIfNeeded(String resolvedUrl) async {
      if (!resolvedUrl.startsWith('http://')) return true;
      if (isLocalAddress(resolvedUrl)) return true;
      final proceed = await showDialog<bool>(
        context: context,
        builder: (dialogCtx) => AlertDialog(
          icon: const Icon(Icons.warning_amber_rounded),
          title: Text(context.l10n.authInsecureTransportTitle),
          content: Text(context.l10n.authInsecureTransportWarning),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogCtx, false),
              child: Text(context.l10n.cancel),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
                foregroundColor: Theme.of(context).colorScheme.onError,
              ),
              onPressed: () => Navigator.pop(dialogCtx, true),
              child: Text(context.l10n.authInsecureTransportContinue),
            ),
          ],
        ),
      );
      return proceed == true;
    }

    String resolveBaseUrl() {
      final baseUrl =
          ref.read(serverUrlProvider) ?? DBKeys.serverUrl.initial;
      return Endpoints.baseApi(
        baseUrl: baseUrl,
        port: ref.read(serverPortProvider),
        addPort: ref.read(serverPortToggleProvider).ifNull(),
      );
    }

    Future<void> doTest() async {
      if (!(formKey.currentState?.validate()).ifNull()) return;
      testing.value = true;
      testResult.value = null;
      try {
        final resolvedUrl = resolveBaseUrl();
        if (!await confirmInsecureIfNeeded(resolvedUrl)) {
          if (!context.mounted) return;
          testing.value = false;
          return;
        }
        final result = await ref
            .read(authCoordinatorProvider.notifier)
            .testConnection(
              authType: authType,
              serverBaseUrl: resolvedUrl,
              username: username.text,
              password: password.text,
              makeGqlClient: () => ref.read(graphQlClientProvider),
            );
        if (!context.mounted) return;
        if (result is TestConnectionSuccess) {
          testResult.value = context.l10n.authTestConnectionSuccess;
          testResultIsError.value = false;
        } else if (result is TestConnectionFailure) {
          testResultIsError.value = true;
          testResult.value = _failureMessage(context, result.kind);
        }
      } finally {
        if (context.mounted) testing.value = false;
      }
    }

    Future<void> doSave() async {
      if (!(formKey.currentState?.validate()).ifNull()) return;
      testing.value = true;
      testResult.value = null;
      try {
        final resolvedUrl = resolveBaseUrl();
        if (!await confirmInsecureIfNeeded(resolvedUrl)) {
          if (!context.mounted) return;
          testing.value = false;
          return;
        }
        ref.read(authUsernameProvider.notifier).update(username.text);
        final store = ref.read(authCredentialsStoreProvider.notifier);
        final coordinator = ref.read(authCoordinatorProvider.notifier);
        if (authType == AuthType.simpleLogin) {
          await store.clearUiLoginTokens();
          await store.clearBasicCredentials();
          await coordinator.loginSimple(
            serverBaseUrl: resolvedUrl,
            username: username.text,
            password: password.text,
          );
        } else if (authType == AuthType.uiLogin) {
          await store.clearSimpleLoginCookie();
          await store.clearBasicCredentials();
          await coordinator.loginUi(
            gqlClient: ref.read(graphQlClientProvider),
            username: username.text,
            password: password.text,
          );
        }
        if (context.mounted) Navigator.pop(context);
      } catch (e) {
        if (!context.mounted) return;
        testResultIsError.value = true;
        testResult.value = _failureMessage(context, classifyAuthError(e).kind);
      } finally {
        if (context.mounted) testing.value = false;
      }
    }

    return AlertDialog(
      title: Text(context.l10n.credentials),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: username,
              validator: (v) => v.isBlank ? context.l10n.errorUserName : null,
              decoration: InputDecoration(
                hintText: context.l10n.userName,
                border: const OutlineInputBorder(),
              ),
            ),
            const Gap(4),
            TextFormField(
              controller: password,
              validator: (v) => v.isBlank ? context.l10n.errorPassword : null,
              obscureText: true,
              decoration: InputDecoration(
                hintText: context.l10n.password,
                border: const OutlineInputBorder(),
              ),
            ),
            const Gap(12),
            Text(
              context.l10n.authReverseProxyHelp,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).hintColor,
                  ),
            ),
            if (authType == AuthType.uiLogin) ...[
              const Gap(8),
              Text(
                context.l10n.authImageUrlLogWarning,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
              ),
            ],
            if (testResult.value != null) ...[
              const Gap(8),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 120),
                child: SingleChildScrollView(
                  child: SelectableText(
                    testResult.value!,
                    style: TextStyle(
                      color: testResultIsError.value
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
      actions: [
        const PopButton(),
        TextButton(
          onPressed: testing.value ? null : doTest,
          child: testing.value
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(context.l10n.authTestConnection),
        ),
        ElevatedButton(
          onPressed: testing.value ? null : doSave,
          child: Text(context.l10n.save),
        ),
      ],
    );
  }
}

/// True for LAN-only hosts where plaintext HTTP is the norm: localhost,
/// 127.x, and RFC1918 IPv4 ranges. We suppress the "Insecure connection"
/// dialog for these because the warning was meant for the open internet,
/// not a 192.168.x.x server. Exposed (not _-prefixed) so the test can
/// exercise the address-matching logic without driving the dialog.
@visibleForTesting
bool isLocalAddress(String url) {
  final host = Uri.tryParse(url)?.host.toLowerCase();
  if (host == null || host.isEmpty) return false;
  if (host == 'localhost') return true;
  final parts = host.split('.');
  if (parts.length != 4) return false;
  final octets = parts.map(int.tryParse).toList();
  if (octets.any((o) => o == null || o < 0 || o > 255)) return false;
  final a = octets[0]!;
  final b = octets[1]!;
  if (a == 127) return true; // 127.0.0.0/8
  if (a == 10) return true; // 10.0.0.0/8
  if (a == 192 && b == 168) return true; // 192.168.0.0/16
  if (a == 172 && b >= 16 && b <= 31) return true; // 172.16.0.0/12
  return false;
}

String _failureMessage(BuildContext context, TestConnectionFailureKind kind) {
  return switch (kind) {
    TestConnectionFailureKind.network =>
      context.l10n.authTestConnectionFailedNetwork,
    TestConnectionFailureKind.tls => context.l10n.authTestConnectionFailedTls,
    TestConnectionFailureKind.invalidCredentials =>
      context.l10n.authTestConnectionFailedAuth,
    TestConnectionFailureKind.wrongAuthMode =>
      context.l10n.authTestConnectionFailedMode,
    TestConnectionFailureKind.unexpectedShape =>
      context.l10n.authTestConnectionFailedShape,
    TestConnectionFailureKind.insecureTransport =>
      context.l10n.authInsecureTransportWarning,
  };
}
