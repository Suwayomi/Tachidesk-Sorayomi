part of '../router_config.dart';

class MigrationGlobalSearchRoute extends GoRouteData {
  const MigrationGlobalSearchRoute();

  static final $parentNavigatorKey = _quickOpenNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final extra = state.extra as MigrationRouteData?;
    
    if (extra == null) {
      // If no manga provided, navigate back
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pop();
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return MigrationGlobalSearchScreen(sourceManga: extra.sourceManga);
  }
}

class MigrationSourceSelectionRoute extends GoRouteData {
  const MigrationSourceSelectionRoute();

  static final $parentNavigatorKey = _quickOpenNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final extra = state.extra as MigrationRouteData?;
    
    if (extra == null) {
      // If no manga provided, navigate back
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pop();
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return MigrationSourceSelectionScreen(sourceManga: extra.sourceManga);
  }
}

class MigrationSearchRoute extends GoRouteData {
  const MigrationSearchRoute();

  static final $parentNavigatorKey = _quickOpenNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final extra = state.extra as MigrationSearchRouteData?;
    
    if (extra == null) {
      // If required data is missing, navigate back
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pop();
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return MigrationSearchScreen(
      sourceManga: extra.sourceManga,
      targetSource: extra.targetSource,
    );
  }
}

class MigrationPreviewRoute extends GoRouteData {
  const MigrationPreviewRoute();

  static final $parentNavigatorKey = _quickOpenNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final extra = state.extra as MigrationPreviewRouteData?;
    
    if (extra == null) {
      // If required data is missing, navigate back
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pop();
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return MigrationPreviewScreen(
      sourceManga: extra.sourceManga,
      targetManga: extra.targetManga,
      targetSource: extra.targetSource,
    );
  }
}

class MigrationProgressRoute extends GoRouteData {
  const MigrationProgressRoute();

  static final $parentNavigatorKey = _quickOpenNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final extra = state.extra as MigrationProgressRouteData?;
    
    if (extra == null) {
      // If required data is missing, navigate back
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pop();
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return MigrationProgressScreen(
      sourceManga: extra.sourceManga,
      targetManga: extra.targetManga,
      targetSource: extra.targetSource,
      options: extra.options,
    );
  }
} 