part of '../router_config.dart';

// History Branch for tablet navigation
class HistoryBranch extends StatefulShellBranchData {
  const HistoryBranch();
  static final $initialLocation = const HistoryTabRoute().location;
}

// History route for tablet navigation tab
class HistoryTabRoute extends GoRouteData {
  const HistoryTabRoute();
  @override
  Widget build(context, state) => const HistoryScreen();
}

// History route for phone navigation (under More)
class HistoryRoute extends GoRouteData {
  const HistoryRoute();
  @override
  Widget build(context, state) => const HistoryScreen();
}
