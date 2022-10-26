import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tachidesk_sorayomi/src/features/settings/widgets/theme_mode_tile.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';

class AppearanceScreen extends StatelessWidget {
  const AppearanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.settingsScreen_appearance.tr())),
      body: ListView(children: const [AppThemeTile()]),
    );
  }
}
