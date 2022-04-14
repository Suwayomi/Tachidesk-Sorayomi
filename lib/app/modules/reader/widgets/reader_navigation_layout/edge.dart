import 'package:flutter/material.dart';

class Edge extends StatelessWidget {
  const Edge.asFunction({Key? key, this.onLeftTap, this.onRightTap})
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
            onTap: onRightTap,
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(),
              ),
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Container(),
                  onTap: onLeftTap,
                ),
              ),
            ],
          ),
        ),
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
