// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import 'package:tachidesk_sorayomi/src/constants/db_keys.dart';
import 'package:tachidesk_sorayomi/src/constants/enum.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/context_extensions.dart';
import 'package:tachidesk_sorayomi/src/widgets/enum_popup.dart';
import '../../../../utils/storage/local/shared_preferences_client.dart';

part 'reader_mode_tile.g.dart';

@riverpod
class ReaderModeKey extends _$ReaderModeKey
    with SharedPreferenceEnumClient<ReaderMode> {
  @override
  ReaderMode? build() {
    client = ref.watch(sharedPreferencesProvider);
    initial = DBKeys.readerMode.initial;
    key = DBKeys.readerMode.name;
    enumList = ReaderMode.values;
    return get;
  }
}

class ReaderModeTile extends HookConsumerWidget {
  const ReaderModeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readerMode = ref.watch(readerModeKeyProvider);
    return ListTile(
      leading: const Icon(Icons.app_settings_alt_rounded),
      subtitle: readerMode != null ? Text(readerMode.toString().tr()) : null,
      title: Text(LocaleKeys.readerSettingsScreen_readerMode.tr()),
      onTap: () => showDialog(
        context: context,
        builder: (context) => EnumPopup<ReaderMode>(
          enumList: ReaderMode.values.sublist(1),
          value: readerMode ?? ReaderMode.webtoon,
          onChange: (enumValue) => ref
              .read(readerModeKeyProvider.notifier)
              .update(enumValue)
              .then((value) => context.navPop()),
        ),
      ),
    );
  }
}
