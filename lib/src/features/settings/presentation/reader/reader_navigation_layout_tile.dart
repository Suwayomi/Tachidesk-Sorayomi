import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tachidesk_sorayomi/src/constants/enum.dart';
import 'package:tachidesk_sorayomi/src/features/settings/data/local_settings_repository.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';

import 'package:tachidesk_sorayomi/src/constants/db_keys.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/context_extensions.dart';
import 'package:tachidesk_sorayomi/src/utils/network/sembast/sembast_client.dart';
import 'package:tachidesk_sorayomi/src/widgets/enum_popup.dart';

final readerNavigationLayoutProvider = Provider.autoDispose(
  (ref) => LocalEnumSettingsRepository<ReaderNavigationLayout>(
    enumList: ReaderNavigationLayout.values,
    client: ref.watch(settingsLocalProvider),
    key: DBKeys.readerNavigationLayout,
  ),
);

final readerNavigationLayoutStreamProvider =
    StreamProvider.autoDispose<ReaderNavigationLayout?>(
        (ref) => ref.watch(readerNavigationLayoutProvider).getStream());

class ReaderNavigationLayoutTile extends HookConsumerWidget {
  const ReaderNavigationLayoutTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readerNavigationLayout =
        ref.watch(readerNavigationLayoutStreamProvider);
    return ListTile(
      leading: const Icon(Icons.touch_app_rounded),
      subtitle: readerNavigationLayout.hasValue
          ? Text(readerNavigationLayout.value.toString().tr())
          : null,
      title: Text(LocaleKeys.readerSettingsScreen_readerNavigationLayout.tr()),
      onTap: () => showDialog(
        context: context,
        useRootNavigator: false,
        builder: (context) => EnumPopup<ReaderNavigationLayout>(
          enumList: ReaderNavigationLayout.values.sublist(1),
          value: readerNavigationLayout.valueOrNull ??
              ReaderNavigationLayout.disabled,
          onChange: (enumValue) => ref
              .read(readerNavigationLayoutProvider)
              .update(enumValue)
              .then((value) => context.navPop()),
          onCancel: context.navPop,
        ),
      ),
    );
  }
}
