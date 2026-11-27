import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../constants/enum.dart';
import '../../../../../../features/auth/data/auth_credentials_store.dart';
import '../../../../../../features/auth/data/auth_state.dart';
import '../../../../../../global_providers/global_providers.dart';
import '../../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../../widgets/section_title.dart';
import '../credential_popup/credentials_popup.dart';
import '../credential_popup/login_credentials_popup.dart';
import 'auth_type/auth_type_tile.dart';

class AuthenticationSection extends ConsumerWidget {
  const AuthenticationSection({super.key});

  @override
  Widget build(context, ref) {
    final authType = ref.watch(authTypeKeyProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: context.l10n.authentication),
        const AuthTypeTile(),
        if (authType != null && authType != AuthType.none) ...[
          ListTile(
            leading: const Icon(Icons.password_rounded),
            title: Text(context.l10n.credentials),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => switch (authType) {
                  AuthType.basic => const CredentialsPopup(),
                  AuthType.simpleLogin =>
                    const LoginCredentialsPopup(authType: AuthType.simpleLogin),
                  AuthType.uiLogin =>
                    const LoginCredentialsPopup(authType: AuthType.uiLogin),
                  AuthType.none => const SizedBox.shrink(),
                },
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout_rounded,
              color: Theme.of(context).colorScheme.error,
            ),
            title: Text(
              context.l10n.authLogout,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            onTap: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (dialogCtx) => AlertDialog(
                  title: Text(context.l10n.authLogout),
                  content: Text(context.l10n.authLogoutConfirm),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(dialogCtx, false),
                      child: Text(context.l10n.cancel),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.error,
                        foregroundColor:
                            Theme.of(context).colorScheme.onError,
                      ),
                      onPressed: () => Navigator.pop(dialogCtx, true),
                      child: Text(context.l10n.authLogout),
                    ),
                  ],
                ),
              );
              if (confirmed != true) return;
              final store = ref.read(authCredentialsStoreProvider.notifier);
              await store.clearUiLoginTokens();
              await store.clearSimpleLoginCookie();
              await store.clearPassword();
              await store.clearBasicCredentials();
              ref.read(authTypeKeyProvider.notifier).update(AuthType.none);
              ref.read(needsReauthProvider.notifier).set(false);
            },
          ),
        ],
      ],
    );
  }
}
