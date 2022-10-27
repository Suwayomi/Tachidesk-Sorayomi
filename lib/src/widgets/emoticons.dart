// 🎯 Dart imports:
import 'dart:math';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';

// 🌎 Project imports:
import '../constants/app_sizes.dart';
import '../utils/extensions/custom_extensions/context_extensions.dart';
import '../utils/extensions/custom_extensions/string_extensions.dart';

const errorFaces = [
  '(･o･;)',
  'Σ(ಠ_ಠ)',
  'ಥ_ಥ',
  '(˘･_･˘)',
  '(；￣Д￣)',
  '(･Д･。',
];

class Emoticons extends HookWidget {
  const Emoticons({
    Key? key,
    this.text,
    this.button,
    this.iconData,
  }) : super(key: key);
  final String? text;
  final IconData? iconData;
  final Widget? button;

  @override
  Widget build(BuildContext context) {
    final errorNumber = useState(Random().nextInt(errorFaces.length));
    return Padding(
      padding: Edge.a8.size,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          iconData != null
              ? Icon(iconData, size: context.height * .2)
              : Text(
                  errorFaces[errorNumber.value],
                  textAlign: TextAlign.center,
                  style: context.textTheme.displayMedium,
                ),
          Box.h16.size,
          if (text.isNotBlank)
            Text(
              text!,
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          if (button != null) button!,
        ],
      ),
    );
  }
}
