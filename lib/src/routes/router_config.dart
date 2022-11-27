// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tachidesk_sorayomi/src/constants/enum.dart';
import 'package:tachidesk_sorayomi/src/features/browse_center/domain/filter/filter_model.dart';
import 'package:tachidesk_sorayomi/src/features/browse_center/presentation/source_manga_list/source_manga_list.dart';
import 'package:tachidesk_sorayomi/src/features/library/presentation/library/library_screen.dart';
import 'package:tachidesk_sorayomi/src/features/manga_book/presentation/manga_details/manga_details.dart';
import 'package:tachidesk_sorayomi/src/features/manga_book/presentation/updates/updates_screen.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/string_extensions.dart';

// 🌎 Project imports:
import '../features/about/presentation/about/about_screen.dart';
import '../features/browse_center/presentation/browse/browse_screen.dart';
import '../features/manga_book/presentation/downloads/downloads_screen.dart';
import '../features/settings/presentation/appearance/appearance_screen.dart';
import '../features/settings/presentation/backup/backup_screen.dart';
import '../features/settings/presentation/browse/browse_settings_screen.dart';
import '../features/library/presentation/category/edit_category_screen.dart';
import '../features/settings/presentation/library/library_settings_screen.dart';
import '../features/settings/presentation/more/more_screen.dart';
import '../features/settings/presentation/reader/reader_settings_screen.dart';
import '../features/settings/presentation/server/server_screen.dart';
import '../features/settings/presentation/settings/settings_screen.dart';
import '../widgets/shell/shell_screen.dart';
part 'router_config.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

abstract class Routes {
  static const home = '/';
  static const library = '/library';
  static const librarySettings = 's-library';
  static const updates = '/updates';
  static const browse = '/browse';
  static const downloads = '/downloads';
  static const more = '/more';
  static const about = '/about';
  static const appearanceSettings = 's-appearance';
  static const backup = 'backup';
  static const settings = '/settings';
  static const browseSettings = 's-browse';
  static const readerSettings = 's-reader';
  static const serverSettings = 's-server';
  static const editCategories = 'edit-categories';
  static const extensions = '/extensions';
  static const manga = '/manga/:mangaId';
  static getManga(int mangaId) => '/manga/$mangaId';
  static const sourceManga = '/source/:sourceId/:sourceType';
  static getSourceManga(String sourceId, SourceType sourceType,
          [String? query]) =>
      '/source/$sourceId/${sourceType.name}${query.isNotBlank ? "?query=$query" : ''}';
  static const globalSearch = '/global-search';
}

@riverpod
GoRouter routerConfig(ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: Routes.library,
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => ShellScreen(child: child),
        routes: [
          GoRoute(
            path: Routes.home,
            redirect: (context, state) => Routes.library,
          ),
          GoRoute(
              path: Routes.library,
              builder: (context, state) => const LibraryScreen()),
          GoRoute(
            path: Routes.updates,
            builder: (context, state) => const UpdatesScreen(),
          ),
          GoRoute(
            path: Routes.browse,
            builder: (context, state) => const BrowseScreen(),
          ),
          GoRoute(
            path: Routes.downloads,
            builder: (context, state) => const DownloadsScreen(),
          ),
          GoRoute(
            path: Routes.more,
            builder: (context, state) => const MoreScreen(),
          ),
        ],
      ),
      GoRoute(
        path: Routes.manga,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => MangaDetails(
          mangaId: state.params['mangaId'] ?? "",
        ),
      ),
      GoRoute(
        path: Routes.sourceManga,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => SourceMangaList(
          sourceId: state.params['sourceId'] ?? "0",
          initialQuery: state.queryParams['query'],
          initialFilter: (state.extra is List<Filter>?)
              ? (state.extra as List<Filter>?)
              : null,
          sourceType: SourceType.values.firstWhere(
            (element) => element.name.query(state.params['sourceType']),
            orElse: () => SourceType.popular,
          ),
        ),
      ),
      GoRoute(
        path: Routes.about,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const AboutScreen(),
      ),
      GoRoute(
        path: Routes.settings,
        builder: (context, state) => const SettingsScreen(),
        routes: [
          GoRoute(
            path: Routes.librarySettings,
            builder: (context, state) => const LibrarySettingsScreen(),
            routes: [
              GoRoute(
                path: Routes.editCategories,
                builder: (context, state) => const EditCategoryScreen(),
              ),
            ],
          ),
          GoRoute(
            path: Routes.serverSettings,
            builder: (context, state) => const ServerScreen(),
          ),
          GoRoute(
            path: Routes.readerSettings,
            builder: (context, state) => const ReaderSettingsScreen(),
          ),
          GoRoute(
            path: Routes.appearanceSettings,
            builder: (context, state) => const AppearanceScreen(),
          ),
          GoRoute(
            path: Routes.browseSettings,
            builder: (context, state) => const BrowseSettingsScreen(),
          ),
          GoRoute(
            path: Routes.backup,
            builder: (context, state) => const BackupScreen(),
          ),
        ],
      ),
    ],
  );
}
