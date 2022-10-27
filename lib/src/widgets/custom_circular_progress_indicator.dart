// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '../constants/app_sizes.dart';

// 🐦 Flutter imports:

// 🌎 Project imports:

class CenterCircularProgressIndicator extends StatelessWidget {
  const CenterCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) =>
      const Center(child: CircularProgressIndicator());
}

class MiniCircularProgressIndicator extends StatelessWidget {
  const MiniCircularProgressIndicator({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) => Padding(
        padding: Edge.a8.size,
        child: SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            color: color,
          ),
        ),
      );
}
