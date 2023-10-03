// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router_config.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $quickSearchRoute,
    ];

RouteBase get $quickSearchRoute => ShellRouteData.$route(
      navigatorKey: QuickSearchRoute.$navigatorKey,
      factory: $QuickSearchRouteExtension._fromState,
      routes: [
        ShellRouteData.$route(
          navigatorKey: ShellRoute.$navigatorKey,
          factory: $ShellRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: '/',
              factory: $HomeRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: '/library',
              factory: $LibraryRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: '/updates',
              factory: $UpdatesRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: '/browse',
              factory: $BrowseRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: '/downloads',
              factory: $DownloadsRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: '/more',
              factory: $MoreRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/manga/:mangaId',
          parentNavigatorKey: MangaRoute.$parentNavigatorKey,
          factory: $MangaRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/update-status',
          parentNavigatorKey: UpdateStatusRoute.$parentNavigatorKey,
          factory: $UpdateStatusRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/global-search',
          parentNavigatorKey: GlobalSearchRoute.$parentNavigatorKey,
          factory: $GlobalSearchRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/source/:sourceId/preference',
          parentNavigatorKey: SourcePreferenceRoute.$parentNavigatorKey,
          factory: $SourcePreferenceRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/source/:sourceId/:sourceType',
          parentNavigatorKey: SourceMangaRoute.$parentNavigatorKey,
          factory: $SourceMangaRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/about',
          parentNavigatorKey: AboutRoute.$parentNavigatorKey,
          factory: $AboutRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/manga/:mangaId/chapter/:chapterIndex',
          parentNavigatorKey: ReaderRoute.$parentNavigatorKey,
          factory: $ReaderRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/settings',
          parentNavigatorKey: SettingsRoute.$parentNavigatorKey,
          factory: $SettingsRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'library',
              parentNavigatorKey: LibrarySettingsRoute.$parentNavigatorKey,
              factory: $LibrarySettingsRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'edit-categories',
                  parentNavigatorKey: EditCategoriesRoute.$parentNavigatorKey,
                  factory: $EditCategoriesRouteExtension._fromState,
                ),
              ],
            ),
            GoRouteData.$route(
              path: 'server',
              parentNavigatorKey: ServerSettingsRoute.$parentNavigatorKey,
              factory: $ServerSettingsRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'reader',
              parentNavigatorKey: ReaderSettingsRoute.$parentNavigatorKey,
              factory: $ReaderSettingsRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'appearance',
              parentNavigatorKey: AppearanceSettingsRoute.$parentNavigatorKey,
              factory: $AppearanceSettingsRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'general',
              parentNavigatorKey: GeneralSettingsRoute.$parentNavigatorKey,
              factory: $GeneralSettingsRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'browse',
              parentNavigatorKey: BrowseSettingsRoute.$parentNavigatorKey,
              factory: $BrowseSettingsRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'backup',
              parentNavigatorKey: BackupRoute.$parentNavigatorKey,
              factory: $BackupRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $QuickSearchRouteExtension on QuickSearchRoute {
  static QuickSearchRoute _fromState(GoRouterState state) =>
      const QuickSearchRoute();
}

extension $ShellRouteExtension on ShellRoute {
  static ShellRoute _fromState(GoRouterState state) => const ShellRoute();
}

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LibraryRouteExtension on LibraryRoute {
  static LibraryRoute _fromState(GoRouterState state) => LibraryRoute(
        initialCategoryOrder: _$convertMapValue(
            'initial-category-order', state.uri.queryParameters, int.parse),
      );

  String get location => GoRouteData.$location(
        '/library',
        queryParams: {
          if (initialCategoryOrder != null)
            'initial-category-order': initialCategoryOrder!.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $UpdatesRouteExtension on UpdatesRoute {
  static UpdatesRoute _fromState(GoRouterState state) => const UpdatesRoute();

  String get location => GoRouteData.$location(
        '/updates',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BrowseRouteExtension on BrowseRoute {
  static BrowseRoute _fromState(GoRouterState state) => const BrowseRoute();

  String get location => GoRouteData.$location(
        '/browse',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DownloadsRouteExtension on DownloadsRoute {
  static DownloadsRoute _fromState(GoRouterState state) =>
      const DownloadsRoute();

  String get location => GoRouteData.$location(
        '/downloads',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MoreRouteExtension on MoreRoute {
  static MoreRoute _fromState(GoRouterState state) => const MoreRoute();

  String get location => GoRouteData.$location(
        '/more',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MangaRouteExtension on MangaRoute {
  static MangaRoute _fromState(GoRouterState state) => MangaRoute(
        mangaId: int.parse(state.pathParameters['mangaId']!),
        categoryId: _$convertMapValue(
            'category-id', state.uri.queryParameters, int.parse),
      );

  String get location => GoRouteData.$location(
        '/manga/${Uri.encodeComponent(mangaId.toString())}',
        queryParams: {
          if (categoryId != null) 'category-id': categoryId!.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $UpdateStatusRouteExtension on UpdateStatusRoute {
  static UpdateStatusRoute _fromState(GoRouterState state) =>
      const UpdateStatusRoute();

  String get location => GoRouteData.$location(
        '/update-status',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GlobalSearchRouteExtension on GlobalSearchRoute {
  static GlobalSearchRoute _fromState(GoRouterState state) => GlobalSearchRoute(
        query: state.uri.queryParameters['query'],
      );

  String get location => GoRouteData.$location(
        '/global-search',
        queryParams: {
          if (query != null) 'query': query,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SourcePreferenceRouteExtension on SourcePreferenceRoute {
  static SourcePreferenceRoute _fromState(GoRouterState state) =>
      SourcePreferenceRoute(
        sourceId: state.pathParameters['sourceId']!,
      );

  String get location => GoRouteData.$location(
        '/source/${Uri.encodeComponent(sourceId)}/preference',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SourceMangaRouteExtension on SourceMangaRoute {
  static SourceMangaRoute _fromState(GoRouterState state) => SourceMangaRoute(
        sourceId: state.pathParameters['sourceId']!,
        sourceType:
            _$SourceTypeEnumMap._$fromName(state.pathParameters['sourceType']!),
        query: state.uri.queryParameters['query'],
        $extra: state.extra as List<Filter>?,
      );

  String get location => GoRouteData.$location(
        '/source/${Uri.encodeComponent(sourceId)}/${Uri.encodeComponent(_$SourceTypeEnumMap[sourceType]!)}',
        queryParams: {
          if (query != null) 'query': query,
        },
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

const _$SourceTypeEnumMap = {
  SourceType.latest: 'latest',
  SourceType.popular: 'popular',
  SourceType.filter: 'filter',
};

extension $AboutRouteExtension on AboutRoute {
  static AboutRoute _fromState(GoRouterState state) => const AboutRoute();

  String get location => GoRouteData.$location(
        '/about',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ReaderRouteExtension on ReaderRoute {
  static ReaderRoute _fromState(GoRouterState state) => ReaderRoute(
        mangaId: int.parse(state.pathParameters['mangaId']!),
        chapterIndex: int.parse(state.pathParameters['chapterIndex']!),
        transVertical: _$convertMapValue(
            'trans-vertical', state.uri.queryParameters, _$boolConverter),
        toPrev: _$convertMapValue(
            'to-prev', state.uri.queryParameters, _$boolConverter),
      );

  String get location => GoRouteData.$location(
        '/manga/${Uri.encodeComponent(mangaId.toString())}/chapter/${Uri.encodeComponent(chapterIndex.toString())}',
        queryParams: {
          if (transVertical != null)
            'trans-vertical': transVertical!.toString(),
          if (toPrev != null) 'to-prev': toPrev!.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LibrarySettingsRouteExtension on LibrarySettingsRoute {
  static LibrarySettingsRoute _fromState(GoRouterState state) =>
      const LibrarySettingsRoute();

  String get location => GoRouteData.$location(
        '/settings/library',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $EditCategoriesRouteExtension on EditCategoriesRoute {
  static EditCategoriesRoute _fromState(GoRouterState state) =>
      const EditCategoriesRoute();

  String get location => GoRouteData.$location(
        '/settings/library/edit-categories',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ServerSettingsRouteExtension on ServerSettingsRoute {
  static ServerSettingsRoute _fromState(GoRouterState state) =>
      const ServerSettingsRoute();

  String get location => GoRouteData.$location(
        '/settings/server',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ReaderSettingsRouteExtension on ReaderSettingsRoute {
  static ReaderSettingsRoute _fromState(GoRouterState state) =>
      const ReaderSettingsRoute();

  String get location => GoRouteData.$location(
        '/settings/reader',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AppearanceSettingsRouteExtension on AppearanceSettingsRoute {
  static AppearanceSettingsRoute _fromState(GoRouterState state) =>
      const AppearanceSettingsRoute();

  String get location => GoRouteData.$location(
        '/settings/appearance',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GeneralSettingsRouteExtension on GeneralSettingsRoute {
  static GeneralSettingsRoute _fromState(GoRouterState state) =>
      const GeneralSettingsRoute();

  String get location => GoRouteData.$location(
        '/settings/general',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BrowseSettingsRouteExtension on BrowseSettingsRoute {
  static BrowseSettingsRoute _fromState(GoRouterState state) =>
      const BrowseSettingsRoute();

  String get location => GoRouteData.$location(
        '/settings/browse',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BackupRouteExtension on BackupRoute {
  static BackupRoute _fromState(GoRouterState state) => const BackupRoute();

  String get location => GoRouteData.$location(
        '/settings/backup',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

extension<T extends Enum> on Map<T, String> {
  T _$fromName(String value) =>
      entries.singleWhere((element) => element.value == value).key;
}

bool _$boolConverter(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      throw UnsupportedError('Cannot convert "$value" into a bool.');
  }
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerConfigHash() => r'c9473ad31b2ecd6bf97eb8e0a2a4edf6683e5f6f';

/// See also [routerConfig].
@ProviderFor(routerConfig)
final routerConfigProvider = AutoDisposeProvider<GoRouter>.internal(
  routerConfig,
  name: r'routerConfigProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routerConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RouterConfigRef = AutoDisposeProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
