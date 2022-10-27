// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../../constants/db_keys.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/storage/local/shared_preferences_client.dart';

final invertTapProvider =
    StateNotifierProvider.autoDispose<SharedPreferenceNotifier<bool>, bool?>(
  (ref) {
    final client = ref.watch(sharedPreferencesProvider);
    final initial = client.getBool(DBKeys.invertTap.name);
    return SharedPreferenceNotifier<bool>(
      client: client,
      key: DBKeys.invertTap.name,
      initial: initial ?? DBKeys.invertTap.initial,
    );
  },
);

class ReaderInvertTapTile extends HookConsumerWidget {
  const ReaderInvertTapTile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
      controlAffinity: ListTileControlAffinity.trailing,
      secondary: const Icon(Icons.switch_left_rounded),
      title: Text(
        LocaleKeys.readerSettingsScreen_readerNavigationLayoutInvert.tr(),
      ),
      onChanged: ref.read(invertTapProvider.notifier).update,
      value: ref.watch(invertTapProvider) ?? false,
    );
  }
}
