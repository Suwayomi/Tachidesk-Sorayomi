// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../utils/extensions/custom_extensions/context_extensions.dart';
import 'big_screen_navigation_bar.dart';
import 'small_screen_navigation_bar.dart';

class ShellScreen extends ConsumerWidget {
  const ShellScreen({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return context.isTablet
        ? Scaffold(
            body: Row(
              children: [
                BigScreenNavigationBar(
                  selectedScreen: GoRouter.of(context).location,
                ),
                Expanded(child: child),
              ],
            ),
          )
        : Scaffold(
            body: child,
            bottomNavigationBar: SmallScreenNavigationBar(
              selectedScreen: GoRouter.of(context).location,
            ),
          );
  }
}
