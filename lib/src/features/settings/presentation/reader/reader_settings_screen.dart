import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tachidesk_sorayomi/src/features/settings/presentation/reader/reader_mode_tile.dart';
import 'package:tachidesk_sorayomi/src/features/settings/presentation/reader/reader_invert_tap_tile.dart';
import 'package:tachidesk_sorayomi/src/features/settings/presentation/reader/reader_navigation_layout_tile.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';

class ReaderSettingsScreen extends StatelessWidget {
  const ReaderSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.settingsScreen_reader.tr()),
      ),
      body: ListView(
        children: const [
          ReaderModeTile(),
          ReaderNavigationLayoutTile(),
          ReaderInvertTapTile(),
        ],
      ),
    );
  }
}
