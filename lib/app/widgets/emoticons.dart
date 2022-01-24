import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

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
  }) : super(key: key);
  final String emptyType;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.scale(
        scale: 3,
        child: ListTile(
          title: Text(
            errorFaces[Random().nextInt(6)],
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            LocaleKeys.no.tr + " " + emptyType,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
