import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tachidesk_sorayomi/src/constants/enum.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';

import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/context_extensions.dart';
import 'package:tachidesk_sorayomi/src/widgets/enum_popup.dart';

import '../../../../global_providers/package_info_provider.dart';

class AuthTypeTile extends HookConsumerWidget {
  const AuthTypeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authType =
        useStream<AuthType?>(ref.watch(authTypeProvider).getStream());
    return ListTile(
      leading: const Icon(Icons.security_rounded),
      subtitle: authType.hasData ? Text(authType.data.toString().tr()) : null,
      title: Text(LocaleKeys.serverSettingsScreen_baseAuthType.tr()),
      onTap: () => showDialog(
        context: context,
        useRootNavigator: false,
        builder: (context) => EnumPopup<AuthType>(
          enumList: AuthType.values,
          value: authType.data ?? AuthType.none,
          onChange: (enumValue) {
            ref.read(authTypeProvider).update(enumValue);
            context.navPop();
          },
          onCancel: context.navPop,
        ),
      ),
    );
  }
}
