// Copyright (c) 2026 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state.g.dart';

/// Tracks whether the current session has expired and the user needs to
/// re-enter their password.
///
/// Set to `true` by:
///   - `SuwayomiAuthLink` when a 401 cannot be resolved by refresh (UI Login)
///   - `SuwayomiAuthLink` when a 401 arrives (Simple Login — no refresh path)
///
/// Cleared to `false` by `AuthCoordinator` after a successful re-login.
///
/// Watched by `ReauthBannerHost` to decide whether to surface the banner
/// via `ScaffoldMessenger`.
@Riverpod(keepAlive: true)
class NeedsReauth extends _$NeedsReauth {
  @override
  bool build() => false;

  void set(bool value) => state = value;
}
