// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import 'package:tachidesk_sorayomi/src/constants/db_keys.dart';
import 'package:tachidesk_sorayomi/src/constants/enum.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/context_extensions.dart';
import 'package:tachidesk_sorayomi/src/widgets/enum_popup.dart';
import '../../../../utils/storage/local/shared_preferences_client.dart';

final readerNavigationLayoutProvider = StateNotifierProvider.autoDispose<
    SharedPreferenceEnumNotifier<ReaderNavigationLayout>,
    ReaderNavigationLayout?>(
  (ref) {
    final client = ref.watch(sharedPreferencesProvider);
    final initial = client.getInt(DBKeys.readerNavigationLayout.name);
    return SharedPreferenceEnumNotifier<ReaderNavigationLayout>(
      enumList: ReaderNavigationLayout.values,
      client: client,
      key: DBKeys.readerNavigationLayout.name,
      initial: initial == null
          ? DBKeys.readerNavigationLayout.initial
          : ReaderNavigationLayout.values[initial],
    );
  },
);

class ReaderNavigationLayoutTile extends HookConsumerWidget {
  const ReaderNavigationLayoutTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readerNavigationLayout = ref.watch(readerNavigationLayoutProvider);
    return ListTile(
      leading: const Icon(Icons.touch_app_rounded),
      subtitle: readerNavigationLayout != null
          ? Text(readerNavigationLayout.toString().tr())
          : null,
      title: Text(LocaleKeys.readerSettingsScreen_readerNavigationLayout.tr()),
      onTap: () => showDialog(
        context: context,
        builder: (context) => EnumPopup<ReaderNavigationLayout>(
          enumList: ReaderNavigationLayout.values.sublist(1),
          value: readerNavigationLayout ?? ReaderNavigationLayout.disabled,
          onChange: (enumValue) => ref
              .read(readerNavigationLayoutProvider.notifier)
              .update(enumValue)
              .then((value) => context.navPop()),
        ),
      ),
    );
  }
}
