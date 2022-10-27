// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../../constants/app_sizes.dart';
import '../../../../constants/db_keys.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../utils/extensions/custom_extensions/string_extensions.dart';
import '../../../../utils/network/sembast/sembast_client.dart';
import '../../../../widgets/pop_button.dart';
import '../../data/local_settings_repository.dart';

// 🎯 Dart imports:

// 🐦 Flutter imports:

// 📦 Package imports:

// 🌎 Project imports:

final credentialsProvider = Provider(
  (ref) => LocalSettingsRepository<String>(
    ref.watch(settingsLocalProvider),
    DBKeys.basicCredentials,
  ),
);

final formKey = GlobalKey<FormState>();

class CredentialsPopup extends HookConsumerWidget {
  const CredentialsPopup({super.key});

  String _basicAuth({
    required String userName,
    required String password,
  }) =>
      'Basic ${base64.encode(
        utf8.encode('$userName:$password'),
      )}';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = useTextEditingController();
    final password = useTextEditingController();
    final credentialProvider = ref.watch(credentialsProvider);
    return AlertDialog(
      title: Text(LocaleKeys.serverSettingsScreen_credentials.tr()),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: username,
              validator: (value) =>
                  value.isBlank ? LocaleKeys.error_userName.tr() : null,
              decoration: InputDecoration(
                hintText: LocaleKeys.serverSettingsScreen_userName.tr(),
                border: const OutlineInputBorder(),
              ),
            ),
            Box.h4.size,
            TextFormField(
              controller: password,
              validator: (value) =>
                  value.isBlank ? LocaleKeys.error_password.tr() : null,
              obscureText: true,
              decoration: InputDecoration(
                hintText: LocaleKeys.serverSettingsScreen_password.tr(),
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        const PopButton(),
        ElevatedButton(
          onPressed: () async {
            if (formKey.currentState?.validate() ?? false) {
              credentialProvider.update(_basicAuth(
                userName: username.text,
                password: password.text,
              ));
            }
            context.navPop();
          },
          child: Text(LocaleKeys.common_save.tr()),
        ),
      ],
    );
  }
}
