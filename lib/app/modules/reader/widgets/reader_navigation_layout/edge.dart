import 'package:flutter/material.dart';

class Edge extends StatelessWidget {
  const Edge({Key? key, this.onBottomTap, this.onSideTap}) : super(key: key);
  final void Function()? onBottomTap;
  final void Function()? onSideTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Container(),
            onTap: onSideTap,
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
                  onTap: onBottomTap,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Container(),
            onTap: onSideTap,
          ),
        ),
      ],
    );
  }
}
