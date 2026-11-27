// Copyright (c) 2026 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/enum.dart';
import '../../../global_providers/global_providers.dart';
import '../../../utils/extensions/custom_extensions.dart';
import '../../settings/presentation/server/widget/credential_popup/login_credentials_popup.dart';
import '../data/auth_state.dart';

/// Layout-neutral host that surfaces a re-auth `MaterialBanner` via
/// `ScaffoldMessenger` when the session has expired. Returns its child
/// unchanged — safe to wrap around `CustomScrollView` or sliver layouts.
class ReauthBannerHost extends ConsumerStatefulWidget {
  const ReauthBannerHost({super.key, required this.child});
  final Widget child;

  @override
  ConsumerState<ReauthBannerHost> createState() => _ReauthBannerHostState();
}

class _ReauthBannerHostState extends ConsumerState<ReauthBannerHost> {
  bool _bannerShown = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (ref.read(needsReauthProvider)) _showBanner();
    });
  }

  void _showBanner() {
    if (_bannerShown) return;
    final messenger = ScaffoldMessenger.maybeOf(context);
    if (messenger == null) return;
    _bannerShown = true;
    messenger.clearMaterialBanners();
    messenger.showMaterialBanner(_buildBanner());
  }

  void _clearBanner() {
    if (!_bannerShown) return;
    _bannerShown = false;
    ScaffoldMessenger.maybeOf(context)?.clearMaterialBanners();
  }

  MaterialBanner _buildBanner() {
    final authType = ref.read(authTypeKeyProvider);
    return MaterialBanner(
      content: Text(context.l10n.authSessionExpired),
      leading: const Icon(Icons.warning_amber_rounded),
      actions: [
        TextButton(
          onPressed: () {
            if (authType == AuthType.simpleLogin ||
                authType == AuthType.uiLogin) {
              showDialog(
                context: context,
                builder: (_) => LoginCredentialsPopup(authType: authType!),
              );
            }
          },
          child: Text(context.l10n.authReauthenticate),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<bool>(needsReauthProvider, (prev, next) {
      if (next) {
        _showBanner();
      } else {
        _clearBanner();
      }
    });
    return widget.child;
  }
}
