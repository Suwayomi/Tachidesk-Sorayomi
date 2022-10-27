// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import 'package:tachidesk_sorayomi/src/constants/db_keys.dart';
import 'package:tachidesk_sorayomi/src/constants/enum.dart';
import 'package:tachidesk_sorayomi/src/features/settings/data/local_settings_repository.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/context_extensions.dart';
import 'package:tachidesk_sorayomi/src/utils/network/sembast/sembast_client.dart';
import 'package:tachidesk_sorayomi/src/widgets/enum_popup.dart';

final readerModeProvider = Provider.autoDispose(
  (ref) => LocalEnumSettingsRepository<ReaderMode>(
    enumList: ReaderMode.values,
    client: ref.watch(settingsLocalProvider),
    key: DBKeys.readerMode,
  ),
);

final readerModeStreamProvider = StreamProvider.autoDispose(
    (ref) => ref.watch(readerModeProvider).getStream());

class ReaderModeTile extends HookConsumerWidget {
  const ReaderModeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readerMode = ref.watch(readerModeStreamProvider);
    return ListTile(
      leading: const Icon(Icons.app_settings_alt_rounded),
      subtitle:
          readerMode.hasValue ? Text(readerMode.value.toString().tr()) : null,
      title: Text(LocaleKeys.readerSettingsScreen_readerMode.tr()),
      onTap: () => showDialog(
        context: context,
        useRootNavigator: false,
        builder: (context) => EnumPopup<ReaderMode>(
          enumList: ReaderMode.values.sublist(1),
          value: readerMode.valueOrNull ?? ReaderMode.webtoon,
          onChange: (enumValue) => ref
              .read(readerModeProvider)
              .update(enumValue)
              .then((value) => context.navPop()),
        ),
      ),
    );
  }
}
