// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../../constants/enum.dart';
import '../../../../global_providers/global_providers.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../widgets/enum_popup.dart';

class AuthTypeTile extends HookConsumerWidget {
  const AuthTypeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authType = ref.watch(authTypeProvider);
    return ListTile(
      leading: const Icon(Icons.security_rounded),
      subtitle: authType != null ? Text(authType.toString().tr()) : null,
      title: Text(LocaleKeys.serverSettingsScreen_baseAuthType.tr()),
      onTap: () => showDialog(
        context: context,
        builder: (context) => EnumPopup<AuthType>(
          enumList: AuthType.values,
          value: authType ?? AuthType.none,
          onChange: (enumValue) {
            ref.read(authTypeProvider.notifier).update(enumValue);
            context.navPop();
          },
        ),
      ),
    );
  }
}
