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
import '../features/library/presentation/category/edit_category_screen.dart';
import '../features/library/presentation/library/library_screen.dart';
import '../features/manga_book/presentation/downloads/downloads_screen.dart';
import '../features/manga_book/presentation/manga_details/manga_details_screen.dart';
import '../features/manga_book/presentation/reader/reader_screen.dart';
import '../features/manga_book/presentation/updates/updates_screen.dart';
import '../features/quick_open/presentation/search_stack/search_stack_screen.dart';
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

final GlobalKey<NavigatorState> _quickOpenNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'Quick Open');

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
  static const globalSearch = '/global-search';
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

@TypedShellRoute<QuickSearchRoute>(
  routes: [
    TypedShellRoute<ShellRoute>(
      routes: [
        TypedGoRoute<HomeRoute>(path: Routes.home),
        TypedGoRoute<LibraryRoute>(path: Routes.library),
        TypedGoRoute<UpdatesRoute>(path: Routes.updates),
        TypedGoRoute<BrowseRoute>(path: Routes.browse),
        TypedGoRoute<DownloadsRoute>(path: Routes.downloads),
        TypedGoRoute<MoreRoute>(path: Routes.more),
      ],
    ),
    TypedGoRoute<MangaRoute>(path: Routes.manga),
    TypedGoRoute<GlobalSearchRoute>(path: Routes.globalSearch),
    TypedGoRoute<SourceMangaRoute>(path: Routes.sourceManga),
    TypedGoRoute<AboutRoute>(path: Routes.about),
    TypedGoRoute<ReaderRoute>(path: Routes.reader),
    TypedGoRoute<SettingsRoute>(path: Routes.settings, routes: [
      TypedGoRoute<LibrarySettingsRoute>(
        path: Routes.librarySettings,
        routes: [
          TypedGoRoute<EditCategoriesRoute>(path: Routes.editCategories)
        ],
      ),
      TypedGoRoute<ServerSettingsRoute>(path: Routes.serverSettings),
      TypedGoRoute<ReaderSettingsRoute>(path: Routes.readerSettings),
      TypedGoRoute<AppearanceSettingsRoute>(path: Routes.appearanceSettings),
      TypedGoRoute<GeneralSettingsRoute>(path: Routes.generalSettings),
      TypedGoRoute<BrowseSettingsRoute>(path: Routes.browseSettings),
      TypedGoRoute<BackupRoute>(path: Routes.backup),
    ])
  ],
)
class QuickSearchRoute extends ShellRouteData {
  const QuickSearchRoute();

  static final $navigatorKey = _quickOpenNavigatorKey;

  @override
  Widget builder(context, state, navigator) =>
      SearchStackScreen(child: navigator);
}

// Shell Routes
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
  Widget build(BuildContext context, GoRouterState state) =>
      LibraryScreen(initialCategoryOrder: initialCategoryOrder);
}

class UpdatesRoute extends GoRouteData {
  const UpdatesRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const UpdatesScreen();
}

class BrowseRoute extends GoRouteData {
  const BrowseRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const BrowseScreen();
}

class DownloadsRoute extends GoRouteData {
  const DownloadsRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DownloadsScreen();
}

class MoreRoute extends GoRouteData {
  const MoreRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const MoreScreen();
}

//
class MangaRoute extends GoRouteData {
  const MangaRoute({required this.mangaId, this.categoryId});
  final int mangaId;
  final int? categoryId;

  static final $parentNavigatorKey = _quickOpenNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      MangaDetailsScreen(mangaId: mangaId, categoryId: categoryId);
}

class GlobalSearchRoute extends GoRouteData {
  const GlobalSearchRoute({this.query});
  final String? query;

  static final $parentNavigatorKey = _quickOpenNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      GlobalSearchScreen(key: ValueKey(query), initialQuery: query);
}

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

  static final $parentNavigatorKey = _quickOpenNavigatorKey;

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

class AboutRoute extends GoRouteData {
  const AboutRoute();

  static final $parentNavigatorKey = _quickOpenNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AboutScreen();
}

class ReaderRoute extends GoRouteData {
  const ReaderRoute({
    required this.mangaId,
    required this.chapterIndex,
    this.transVertical,
    this.toPrev,
  });
  final int mangaId;
  final int chapterIndex;
  final bool? transVertical;
  final bool? toPrev;

  static final $parentNavigatorKey = _quickOpenNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: ReaderScreen(mangaId: mangaId, chapterIndex: chapterIndex),
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

class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  static final $parentNavigatorKey = _quickOpenNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsScreen();
}

class LibrarySettingsRoute extends GoRouteData {
  const LibrarySettingsRoute();

  static final $parentNavigatorKey = _quickOpenNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LibrarySettingsScreen();
}

class EditCategoriesRoute extends GoRouteData {
  const EditCategoriesRoute();

  static final $parentNavigatorKey = _quickOpenNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const EditCategoryScreen();
}

class ServerSettingsRoute extends GoRouteData {
  const ServerSettingsRoute();

  static final $parentNavigatorKey = _quickOpenNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ServerScreen();
}

class ReaderSettingsRoute extends GoRouteData {
  const ReaderSettingsRoute();

  static final $parentNavigatorKey = _quickOpenNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ReaderSettingsScreen();
}

class AppearanceSettingsRoute extends GoRouteData {
  const AppearanceSettingsRoute();

  static final $parentNavigatorKey = _quickOpenNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AppearanceScreen();
}

class GeneralSettingsRoute extends GoRouteData {
  const GeneralSettingsRoute();

  static final $parentNavigatorKey = _quickOpenNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const GeneralScreen();
}

class BrowseSettingsRoute extends GoRouteData {
  const BrowseSettingsRoute();

  static final $parentNavigatorKey = _quickOpenNavigatorKey;

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
