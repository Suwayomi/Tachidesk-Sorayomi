// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import '../../../../../../constants/db_keys.dart';
import '../../../../../../i18n/locale_keys.g.dart';
import '../../../../../../utils/storage/local/shared_preferences_client.dart';

part 'reader_invert_tap_tile.g.dart';

@riverpod
class InvertTap extends _$InvertTap with SharedPreferenceClient<bool> {
  @override
  bool? build() => initialize(
        client: ref.watch(sharedPreferencesProvider),
        key: DBKeys.invertTap.name,
        initial: DBKeys.invertTap.initial,
      );
}

class ReaderInvertTapTile extends HookConsumerWidget {
  const ReaderInvertTapTile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
      controlAffinity: ListTileControlAffinity.trailing,
      secondary: const Icon(Icons.switch_left_rounded),
      title: Text(
        LocaleKeys.readerNavigationLayoutInvert.tr(),
      ),
      onChanged: ref.read(invertTapProvider.notifier).update,
      value: ref.watch(invertTapProvider) ?? false,
    );
  }
}
