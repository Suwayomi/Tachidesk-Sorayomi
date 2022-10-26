import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tachidesk_sorayomi/src/constants/db_keys.dart';
import 'package:tachidesk_sorayomi/src/features/settings/data/local_settings_repository.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';
import 'package:tachidesk_sorayomi/src/utils/network/sembast/sembast_client.dart';

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
