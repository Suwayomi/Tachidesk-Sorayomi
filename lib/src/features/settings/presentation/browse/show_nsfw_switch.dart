import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../../constants/db_keys.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/network/sembast/sembast_client.dart';
import '../../data/local_settings_repository.dart';

// 🐦 Flutter imports:

// 📦 Package imports:

// 🌎 Project imports:

final showNSFWProvider = Provider(
  (ref) => LocalSettingsRepository<bool>(
    ref.watch(settingsLocalProvider),
    DBKeys.showNSFW,
  ),
);

final showNSFWStreamProvider =
    StreamProvider((ref) => ref.watch(showNSFWProvider).getStream());

class ShowNSFWTile extends HookConsumerWidget {
  const ShowNSFWTile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showNSFW = ref.watch(showNSFWStreamProvider);
    return SwitchListTile(
      controlAffinity: ListTileControlAffinity.trailing,
      secondary: const Icon(Icons.eighteen_up_rating_rounded),
      title: Text(
        LocaleKeys.browserSettingsScreen_nsfw_title.tr(),
      ),
      subtitle: Text(LocaleKeys.browserSettingsScreen_nsfw_subtitle.tr()),
      onChanged: (value) {
        ref.read(showNSFWProvider).update(value);
      },
      value: showNSFW.hasValue ? showNSFW.valueOrNull! : false,
    );
  }
}
