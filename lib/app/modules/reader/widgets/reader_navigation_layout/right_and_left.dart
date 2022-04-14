import 'package:flutter/material.dart';

class RightAndLeft extends StatelessWidget {
  const RightAndLeft.asFunction({Key? key, this.onLeftTap, this.onRightTap})
      : super(key: key);
  final void Function()? onLeftTap;
  final void Function()? onRightTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Container(),
            onTap: onLeftTap,
          ),
        ),
        Expanded(child: Container()),
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Container(),
            onTap: onRightTap,
          ),
        ),
      ],
    );
  }
}
