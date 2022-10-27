// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../../constants/db_keys.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/network/sembast/sembast_client.dart';
import '../../data/local_settings_repository.dart';

final invertTapProvider = Provider(
  (ref) => LocalSettingsRepository<bool>(
    ref.watch(settingsLocalProvider),
    DBKeys.invertTap,
  ),
);

final invertTapStreamProvider =
    StreamProvider((ref) => ref.watch(invertTapProvider).getStream());

class ReaderInvertTapTile extends HookConsumerWidget {
  const ReaderInvertTapTile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invertTap = ref.watch(invertTapStreamProvider);
    return SwitchListTile(
      controlAffinity: ListTileControlAffinity.trailing,
      secondary: const Icon(Icons.switch_left_rounded),
      title: Text(
        LocaleKeys.readerSettingsScreen_readerNavigationLayoutInvert.tr(),
      ),
      onChanged: (value) {
        ref.read(invertTapProvider).update(value);
      },
      value: invertTap.valueOrNull ?? false,
    );
  }
}
