// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../features/about/presentation/about/about_screen.dart';
import '../features/browse/presentation/browse/browse_screen.dart';
import '../features/settings/presentation/appearance/appearance_screen.dart';
import '../features/settings/presentation/backup/backup_screen.dart';
import '../features/settings/presentation/browse/browse_settings_screen.dart';
import '../features/settings/presentation/category/edit_category_settings.dart';
import '../features/settings/presentation/library/library_settings_screen.dart';
import '../features/settings/presentation/more/more_screen.dart';
import '../features/settings/presentation/reader/reader_settings_screen.dart';
import '../features/settings/presentation/server/server_screen.dart';
import '../features/settings/presentation/settings/settings_screen.dart';
import '../widgets/shell/shell_screen.dart';

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
  static const backup = 'backup';
  static const settings = '/settings';
  static const browseSettingsScreen = 'browse';
  static const readerSettings = 'reader';
  static const serverSettings = 'server';
  static const editCategories = 'edit-categories';
  static const extensions = '/extensions';
  static const sources = '/sources';
  static const manga = '/manga';
  static const sourceManga = '/source';
  static const globalSearch = '/global-search';
}

final routerConfigProvider = Provider<GoRouter>(
  (ref) {
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
              builder: (context, state) => const Scaffold(
                body: Center(child: Text(Routes.library)),
                backgroundColor: Colors.amber,
              ),
            ),
            GoRoute(
              path: Routes.updates,
              builder: (context, state) => const Scaffold(
                body: Center(child: Text(Routes.updates)),
                backgroundColor: Colors.black,
              ),
            ),
            GoRoute(
              path: Routes.browse,
              builder: (context, state) => const BrowseScreen(),
            ),
            GoRoute(
              path: Routes.downloads,
              builder: (context, state) => const Scaffold(
                body: Center(child: Text(Routes.downloads)),
                backgroundColor: Colors.blue,
              ),
            ),
            GoRoute(
              path: Routes.more,
              builder: (context, state) => const MoreScreen(),
            ),
          ],
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
                    builder: (context, state) => const EditCategorySettings(),
                  ),
                ]),
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
              path: Routes.browseSettingsScreen,
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
  },
);
