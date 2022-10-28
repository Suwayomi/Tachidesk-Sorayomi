// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../../constants/db_keys.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/storage/local/shared_preferences_client.dart';

final showNSFWProvider =
    StateNotifierProvider<SharedPreferenceNotifier<bool>, bool?>(
  (ref) {
    final client = ref.watch(sharedPreferencesProvider);
    final initial = client.getBool(DBKeys.showNSFW.name);
    return SharedPreferenceNotifier<bool>(
      client: client,
      key: DBKeys.showNSFW.name,
      initial: initial ?? DBKeys.showNSFW.initial,
    );
  },
);

class ShowNSFWTile extends HookConsumerWidget {
  const ShowNSFWTile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
      controlAffinity: ListTileControlAffinity.trailing,
      secondary: const Icon(Icons.eighteen_up_rating_rounded),
      title: Text(
        LocaleKeys.browserSettingsScreen_nsfw_title.tr(),
      ),
      subtitle: Text(LocaleKeys.browserSettingsScreen_nsfw_subtitle.tr()),
      onChanged: ref.read(showNSFWProvider.notifier).update,
      value: ref.watch(showNSFWProvider) ?? false,
    );
  }
}
