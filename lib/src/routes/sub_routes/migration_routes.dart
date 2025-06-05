part of '../router_config.dart';

class MigrationGlobalSearchRoute extends GoRouteData {
  const MigrationGlobalSearchRoute();

  static final $parentNavigatorKey = _quickOpenNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>?;
    final sourceManga = extra?['sourceManga'];
    
    if (sourceManga == null) {
      // If no manga provided, navigate back
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pop();
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return MigrationGlobalSearchScreen(sourceManga: sourceManga);
  }
}

class MigrationSourceSelectionRoute extends GoRouteData {
  const MigrationSourceSelectionRoute();

  static final $parentNavigatorKey = _quickOpenNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>?;
    final sourceManga = extra?['sourceManga'];
    
    if (sourceManga == null) {
      // If no manga provided, navigate back
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pop();
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return MigrationSourceSelectionScreen(sourceManga: sourceManga);
  }
}

class MigrationSearchRoute extends GoRouteData {
  const MigrationSearchRoute();

  static final $parentNavigatorKey = _quickOpenNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>?;
    final sourceManga = extra?['sourceManga'];
    final targetSource = extra?['targetSource'];
    
    if (sourceManga == null || targetSource == null) {
      // If required data is missing, navigate back
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pop();
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return MigrationSearchScreen(
      sourceManga: sourceManga,
      targetSource: targetSource,
    );
  }
}

class MigrationPreviewRoute extends GoRouteData {
  const MigrationPreviewRoute();

  static final $parentNavigatorKey = _quickOpenNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>?;
    final sourceManga = extra?['sourceManga'];
    final targetManga = extra?['targetManga'];
    final targetSource = extra?['targetSource'];
    
    if (sourceManga == null || targetManga == null || targetSource == null) {
      // If required data is missing, navigate back
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pop();
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return MigrationPreviewScreen(
      sourceManga: sourceManga,
      targetManga: targetManga,
      targetSource: targetSource,
    );
  }
}

class MigrationProgressRoute extends GoRouteData {
  const MigrationProgressRoute();

  static final $parentNavigatorKey = _quickOpenNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>?;
    final sourceManga = extra?['sourceManga'];
    final targetManga = extra?['targetManga'];
    final targetSource = extra?['targetSource'];
    final options = extra?['options'];
    
    if (sourceManga == null || targetManga == null || targetSource == null || options == null) {
      // If required data is missing, navigate back
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.pop();
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return MigrationProgressScreen(
      sourceManga: sourceManga,
      targetManga: targetManga,
      targetSource: targetSource,
      options: options,
    );
  }
} 