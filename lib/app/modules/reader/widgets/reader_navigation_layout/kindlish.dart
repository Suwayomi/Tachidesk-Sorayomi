import 'package:flutter/material.dart';

class Kindlish extends StatelessWidget {
  const Kindlish.asFunction({Key? key, this.onLeftTap, this.onRightTap})
      : super(key: key);
  final void Function()? onLeftTap;
  final void Function()? onRightTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(child: Container()),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Container(),
                  onTap: onLeftTap,
                ),
              ),
              Expanded(
                flex: 2,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Container(),
                  onTap: onRightTap,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
