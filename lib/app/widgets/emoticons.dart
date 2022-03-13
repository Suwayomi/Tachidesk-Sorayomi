import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../generated/locales.g.dart';

const errorFaces = [
  '(･o･;)',
  'Σ(ಠ_ಠ)',
  'ಥ_ಥ',
  '(˘･_･˘)',
  '(；￣Д￣)',
  '(･Д･。',
];

class EmoticonsView extends StatelessWidget {
  const EmoticonsView({
    Key? key,
    required this.emptyType,
    this.button,
  }) : super(key: key);
  final String emptyType;
  final Widget? button;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          title: Text(
            errorFaces[Random().nextInt(6)],
            textAlign: TextAlign.center,
            style: Get.textTheme.headlineLarge,
          ),
          subtitle: Text(
            LocaleKeys.no.tr + " " + emptyType,
            textAlign: TextAlign.center,
            style: Get.textTheme.headlineSmall,
          ),
        ),
        button ?? Container()
      ],
    );
  }
}
