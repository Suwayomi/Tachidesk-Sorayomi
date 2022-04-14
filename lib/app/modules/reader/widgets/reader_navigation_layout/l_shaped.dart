import 'package:flutter/material.dart';

class LShaped extends StatelessWidget {
  const LShaped({Key? key, this.onTopLeftTap, this.onBottomRightTap})
      : super(key: key);

  final void Function()? onTopLeftTap;
  final void Function()? onBottomRightTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Container(),
            onTap: onTopLeftTap,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Container(),
                  onTap: onTopLeftTap,
                ),
              ),
              Expanded(child: Container()),
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Container(),
                  onTap: onBottomRightTap,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Container(),
            onTap: onBottomRightTap,
          ),
        ),
      ],
    );
  }
}
