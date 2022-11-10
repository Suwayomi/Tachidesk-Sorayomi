// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import '../../../../i18n/locale_keys.g.dart';
import '../../widgets/theme_mode_tile.dart';

class AppearanceScreen extends StatelessWidget {
  const AppearanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.appearance.tr())),
      body: ListView(children: const [AppThemeTile()]),
    );
  }
}
