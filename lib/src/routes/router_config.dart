// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/enum.dart';
import '../features/about/presentation/about/about_screen.dart';
import '../features/browse_center/domain/filter/filter_model.dart';
import '../features/browse_center/presentation/browse/browse_screen.dart';
import '../features/browse_center/presentation/global_search/global_search_screen.dart';
import '../features/browse_center/presentation/source_manga_list/source_manga_list_screen.dart';
import '../features/browse_center/presentation/source_preference/source_preference_screen.dart';
import '../features/library/presentation/category/edit_category_screen.dart';
import '../features/library/presentation/library/library_screen.dart';
import '../features/manga_book/presentation/downloads/downloads_screen.dart';
import '../features/manga_book/presentation/manga_details/manga_details_screen.dart';
import '../features/manga_book/presentation/reader/reader_screen.dart';
import '../features/manga_book/presentation/updates/updates_screen.dart';
import '../features/manga_book/widgets/update_status_summary_sheet.dart';
import '../features/settings/presentation/appearance/appearance_screen.dart';
import '../features/settings/presentation/backup/backup_screen.dart';
import '../features/settings/presentation/browse/browse_settings_screen.dart';
import '../features/settings/presentation/general/general_screen.dart';
import '../features/settings/presentation/library/library_settings_screen.dart';
import '../features/settings/presentation/more/more_screen.dart';
import '../features/settings/presentation/reader/reader_settings_screen.dart';
import '../features/settings/presentation/server/server_screen.dart';
import '../features/settings/presentation/settings/settings_screen.dart';
import '../utils/extensions/custom_extensions.dart';
import '../widgets/shell/shell_screen.dart';

part 'router_config.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

abstract class Routes {
  static const home = '/';
  static const library = '/library';
  static const librarySettings = 'library';
  static const updates = '/updates';
  static const browse = '/browse';
  static const downloads = '/downloads';
  static const more = '/more';
  static const about = '/about';
  static const appearanceSettings = 'appearance';
  static const generalSettings = 'general';
  static const backup = 'backup';
  static const settings = '/settings';
  static const browseSettings = 'browse';
  static const readerSettings = 'reader';
  static const reader = '/manga/:mangaId/chapter/:chapterIndex';
  static const serverSettings = 'server';
  static const editCategories = 'edit-categories';
  static const extensions = '/extensions';
  static const manga = '$mangaRoute:mangaId';
  static const mangaRoute = '/manga/';
  static const sourceManga = '/source/:sourceId/:sourceType';
  static const sourcePreference = '/source/:sourceId/preference';
  static const globalSearch = '/global-search';
  static const updateStatus = "/update-status";
}

@riverpod
GoRouter routerConfig(ref) {
  return GoRouter(
    routes: $appRoutes,
    debugLogDiagnostics: true,
    initialLocation: Routes.library,
    navigatorKey: _rootNavigatorKey,
  );
}

// Shell Routes
@TypedShellRoute<ShellRoute>(
  routes: [
    TypedGoRoute<HomeRoute>(path: Routes.home),
    TypedGoRoute<LibraryRoute>(path: Routes.library),
    TypedGoRoute<UpdatesRoute>(path: Routes.updates),
    TypedGoRoute<BrowseRoute>(path: Routes.browse),
    TypedGoRoute<DownloadsRoute>(path: Routes.downloads),
    TypedGoRoute<MoreRoute>(path: Routes.more),
  ],
)
class ShellRoute extends ShellRouteData {
  const ShellRoute();

  static final $navigatorKey = _shellNavigatorKey;

  @override
  Widget builder(context, state, navigator) => ShellScreen(child: navigator);
}

class HomeRoute extends GoRouteData {
  const HomeRoute();
  @override
  FutureOr<String?> redirect(context, state) => Routes.library;
}

class LibraryRoute extends GoRouteData {
  const LibraryRoute({this.initialCategoryOrder});
  final int? initialCategoryOrder;
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage(
          child: LibraryScreen(initialCategoryOrder: initialCategoryOrder));
}

class UpdatesRoute extends GoRouteData {
  const UpdatesRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: UpdatesScreen());
}

class BrowseRoute extends GoRouteData {
  const BrowseRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: BrowseScreen());
}

class DownloadsRoute extends GoRouteData {
  const DownloadsRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: DownloadsScreen());
}

class MoreRoute extends GoRouteData {
  const MoreRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: MoreScreen());
}

@TypedGoRoute<MangaRoute>(path: Routes.manga)
class MangaRoute extends GoRouteData {
  const MangaRoute({required this.mangaId, this.categoryId});
  final int mangaId;
  final int? categoryId;

  static final $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      MangaDetailsScreen(mangaId: mangaId, categoryId: categoryId);
}

@TypedGoRoute<UpdateStatusRoute>(path: Routes.updateStatus)
class UpdateStatusRoute extends GoRouteData {
  const UpdateStatusRoute();

  static final $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const UpdateStatusSummaryDialog();
}

@TypedGoRoute<GlobalSearchRoute>(path: Routes.globalSearch)
class GlobalSearchRoute extends GoRouteData {
  const GlobalSearchRoute({this.query});
  final String? query;

  static final $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      GlobalSearchScreen(key: ValueKey(query), initialQuery: query);
}

@TypedGoRoute<SourceMangaRoute>(path: Routes.sourceManga)
class SourceMangaRoute extends GoRouteData {
  const SourceMangaRoute({
    required this.sourceId,
    required this.sourceType,
    this.query,
    this.$extra,
  });
  final String sourceId;
  final SourceType sourceType;
  final String? query;
  final List<Filter>? $extra;

  static final $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      SourceMangaListScreen(
        key: ValueKey(sourceId),
        sourceId: sourceId,
        sourceType: sourceType,
        initialQuery: query,
        initialFilter: $extra,
      );
}

@TypedGoRoute<SourcePreferenceRoute>(path: Routes.sourcePreference)
class SourcePreferenceRoute extends GoRouteData {
  final String sourceId;
  const SourcePreferenceRoute({required this.sourceId});

  static final $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SourcePreferenceScreen(sourceId: sourceId);
  }
}

@TypedGoRoute<AboutRoute>(path: Routes.about)
class AboutRoute extends GoRouteData {
  const AboutRoute();

  static final $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AboutScreen();
}

@TypedGoRoute<ReaderRoute>(path: Routes.reader)
class ReaderRoute extends GoRouteData {
  const ReaderRoute({
    required this.mangaId,
    required this.chapterIndex,
    this.transVertical,
    this.toPrev,
    this.showReaderLayoutAnimation = false,
  });
  final int mangaId;
  final int chapterIndex;
  final bool? transVertical;
  final bool? toPrev;
  final bool showReaderLayoutAnimation;

  static final $parentNavigatorKey = _rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: ReaderScreen(
        mangaId: mangaId,
        chapterIndex: chapterIndex,
        showReaderLayoutAnimation: showReaderLayoutAnimation,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        Offset offset = Offset.zero;
        offset += Offset(
          transVertical.ifNull() ? 0 : 1,
          transVertical.ifNull() ? 1 : 0,
        );
        if (toPrev.ifNull()) {
          offset *= -1;
        }

        return SlideTransition(
          position: Tween<Offset>(
            begin: offset,
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }
}

@TypedGoRoute<SettingsRoute>(path: Routes.settings, routes: [
  TypedGoRoute<LibrarySettingsRoute>(
    path: Routes.librarySettings,
    routes: [TypedGoRoute<EditCategoriesRoute>(path: Routes.editCategories)],
  ),
  TypedGoRoute<ServerSettingsRoute>(path: Routes.serverSettings),
  TypedGoRoute<ReaderSettingsRoute>(path: Routes.readerSettings),
  TypedGoRoute<AppearanceSettingsRoute>(path: Routes.appearanceSettings),
  TypedGoRoute<GeneralSettingsRoute>(path: Routes.generalSettings),
  TypedGoRoute<BrowseSettingsRoute>(path: Routes.browseSettings),
  TypedGoRoute<BackupRoute>(path: Routes.backup),
])
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  static final $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsScreen();
}

class LibrarySettingsRoute extends GoRouteData {
  const LibrarySettingsRoute();

  static final $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LibrarySettingsScreen();
}

class EditCategoriesRoute extends GoRouteData {
  const EditCategoriesRoute();

  static final $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const EditCategoryScreen();
}

class ServerSettingsRoute extends GoRouteData {
  const ServerSettingsRoute();

  static final $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ServerScreen();
}

class ReaderSettingsRoute extends GoRouteData {
  const ReaderSettingsRoute();

  static final $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ReaderSettingsScreen();
}

class AppearanceSettingsRoute extends GoRouteData {
  const AppearanceSettingsRoute();

  static final $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AppearanceScreen();
}

class GeneralSettingsRoute extends GoRouteData {
  const GeneralSettingsRoute();

  static final $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const GeneralScreen();
}

class BrowseSettingsRoute extends GoRouteData {
  const BrowseSettingsRoute();

  static final $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const BrowseSettingsScreen();
}

class BackupRoute extends GoRouteData {
  const BackupRoute();

  static final $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const BackupScreen();
}
