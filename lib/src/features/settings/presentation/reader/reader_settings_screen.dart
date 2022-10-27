// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';

// 🌎 Project imports:
import '../../../../i18n/locale_keys.g.dart';
import 'reader_invert_tap_tile.dart';
import 'reader_mode_tile.dart';
import 'reader_navigation_layout_tile.dart';

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
