// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import '../../../../constants/db_keys.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/storage/local/shared_preferences_client.dart';

part 'show_nsfw_switch.g.dart';

@riverpod
class ShowNSFW extends _$ShowNSFW with SharedPreferenceClient<bool> {
  @override
  bool? build() {
    client = ref.watch(sharedPreferencesProvider);
    initial = DBKeys.showNSFW.initial;
    key = DBKeys.showNSFW.name;
    return get;
  }
}

class ShowNSFWTile extends HookConsumerWidget {
  const ShowNSFWTile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
      controlAffinity: ListTileControlAffinity.trailing,
      secondary: const Icon(Icons.eighteen_up_rating_rounded),
      title: Text(
        LocaleKeys.nsfw_title.tr(),
      ),
      subtitle: Text(LocaleKeys.nsfw_subtitle.tr()),
      onChanged: ref.read(showNSFWProvider.notifier).update,
      value: ref.watch(showNSFWProvider) ?? false,
    );
  }
}
