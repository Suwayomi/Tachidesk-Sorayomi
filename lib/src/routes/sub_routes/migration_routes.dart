part of '../router_config.dart';

class MigrationGlobalSearchRoute extends GoRouteData {
  const MigrationGlobalSearchRoute({this.$extra});

  static final $parentNavigatorKey = _quickOpenNavigatorKey;
  final MigrationRouteData? $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    if ($extra == null) {
      // If no manga provided, navigate back
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pop();
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return MigrationGlobalSearchScreen(sourceManga: $extra!.sourceManga);
  }
}

class MigrationSourceSelectionRoute extends GoRouteData {
  const MigrationSourceSelectionRoute({this.$extra});

  static final $parentNavigatorKey = _quickOpenNavigatorKey;
  final MigrationRouteData? $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    if ($extra == null) {
      // If no manga provided, navigate back
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pop();
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return MigrationSourceSelectionScreen(sourceManga: $extra!.sourceManga);
  }
}

class MigrationSearchRoute extends GoRouteData {
  const MigrationSearchRoute({this.$extra});

  static final $parentNavigatorKey = _quickOpenNavigatorKey;
  final MigrationSearchRouteData? $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    if ($extra == null) {
      // If required data is missing, navigate back
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pop();
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return MigrationSearchScreen(
      sourceManga: $extra!.sourceManga,
      targetSource: $extra!.targetSource,
    );
  }
}

class MigrationPreviewRoute extends GoRouteData {
  const MigrationPreviewRoute({this.$extra});

  static final $parentNavigatorKey = _quickOpenNavigatorKey;
  final MigrationPreviewRouteData? $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    if ($extra == null) {
      // If required data is missing, navigate back
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pop();
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return MigrationPreviewScreen(
      sourceManga: $extra!.sourceManga,
      targetManga: $extra!.targetManga,
      targetSource: $extra!.targetSource,
    );
  }
}

class MigrationProgressRoute extends GoRouteData {
  const MigrationProgressRoute({this.$extra});

  static final $parentNavigatorKey = _quickOpenNavigatorKey;
  final MigrationProgressRouteData? $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    if ($extra == null) {
      // If required data is missing, navigate back
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pop();
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return MigrationProgressScreen(
      sourceManga: $extra!.sourceManga,
      targetManga: $extra!.targetManga,
      targetSource: $extra!.targetSource,
      options: $extra!.options,
    );
  }
}
