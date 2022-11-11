// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';

// 🌎 Project imports:
import '../../../../i18n/locale_keys.g.dart';
import 'widgets/reader_invert_tap_tile/reader_invert_tap_tile.dart';
import 'widgets/reader_mode_tile/reader_mode_tile.dart';
import 'widgets/reader_navigation_layout_tile/reader_navigation_layout_tile.dart';

class ReaderSettingsScreen extends StatelessWidget {
  const ReaderSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.reader.tr()),
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
