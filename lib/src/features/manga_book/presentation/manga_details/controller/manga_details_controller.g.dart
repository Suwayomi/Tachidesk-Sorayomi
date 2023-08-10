// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_details_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mangaScanlatorListHash() =>
    r'de9a418bc7324f26283f6409bff10dff5b8c676d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef MangaScanlatorListRef = AutoDisposeProviderRef<Set<String>>;

/// See also [mangaScanlatorList].
@ProviderFor(mangaScanlatorList)
const mangaScanlatorListProvider = MangaScanlatorListFamily();

/// See also [mangaScanlatorList].
class MangaScanlatorListFamily extends Family<Set<String>> {
  /// See also [mangaScanlatorList].
  const MangaScanlatorListFamily();

  /// See also [mangaScanlatorList].
  MangaScanlatorListProvider call({
    required int mangaId,
  }) {
    return MangaScanlatorListProvider(
      mangaId: mangaId,
    );
  }

  @override
  MangaScanlatorListProvider getProviderOverride(
    covariant MangaScanlatorListProvider provider,
  ) {
    return call(
      mangaId: provider.mangaId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'mangaScanlatorListProvider';
}

/// See also [mangaScanlatorList].
class MangaScanlatorListProvider extends AutoDisposeProvider<Set<String>> {
  /// See also [mangaScanlatorList].
  MangaScanlatorListProvider({
    required this.mangaId,
  }) : super.internal(
          (ref) => mangaScanlatorList(
            ref,
            mangaId: mangaId,
          ),
          from: mangaScanlatorListProvider,
          name: r'mangaScanlatorListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mangaScanlatorListHash,
          dependencies: MangaScanlatorListFamily._dependencies,
          allTransitiveDependencies:
              MangaScanlatorListFamily._allTransitiveDependencies,
        );

  final int mangaId;

  @override
  bool operator ==(Object other) {
    return other is MangaScanlatorListProvider && other.mangaId == mangaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mangaId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$mangaChapterListWithFilterHash() =>
    r'd8e95ee63920e7ee5acf15deda7b9d795ca452c9';
typedef MangaChapterListWithFilterRef
    = AutoDisposeProviderRef<AsyncValue<List<Chapter>?>>;

/// See also [mangaChapterListWithFilter].
@ProviderFor(mangaChapterListWithFilter)
const mangaChapterListWithFilterProvider = MangaChapterListWithFilterFamily();

/// See also [mangaChapterListWithFilter].
class MangaChapterListWithFilterFamily
    extends Family<AsyncValue<List<Chapter>?>> {
  /// See also [mangaChapterListWithFilter].
  const MangaChapterListWithFilterFamily();

  /// See also [mangaChapterListWithFilter].
  MangaChapterListWithFilterProvider call({
    required int mangaId,
  }) {
    return MangaChapterListWithFilterProvider(
      mangaId: mangaId,
    );
  }

  @override
  MangaChapterListWithFilterProvider getProviderOverride(
    covariant MangaChapterListWithFilterProvider provider,
  ) {
    return call(
      mangaId: provider.mangaId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'mangaChapterListWithFilterProvider';
}

/// See also [mangaChapterListWithFilter].
class MangaChapterListWithFilterProvider
    extends AutoDisposeProvider<AsyncValue<List<Chapter>?>> {
  /// See also [mangaChapterListWithFilter].
  MangaChapterListWithFilterProvider({
    required this.mangaId,
  }) : super.internal(
          (ref) => mangaChapterListWithFilter(
            ref,
            mangaId: mangaId,
          ),
          from: mangaChapterListWithFilterProvider,
          name: r'mangaChapterListWithFilterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mangaChapterListWithFilterHash,
          dependencies: MangaChapterListWithFilterFamily._dependencies,
          allTransitiveDependencies:
              MangaChapterListWithFilterFamily._allTransitiveDependencies,
        );

  final int mangaId;

  @override
  bool operator ==(Object other) {
    return other is MangaChapterListWithFilterProvider &&
        other.mangaId == mangaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mangaId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$firstUnreadInFilteredChapterListHash() =>
    r'ed13a5108da7bb4f9224899075348531da8a118e';
typedef FirstUnreadInFilteredChapterListRef = AutoDisposeProviderRef<Chapter?>;

/// See also [firstUnreadInFilteredChapterList].
@ProviderFor(firstUnreadInFilteredChapterList)
const firstUnreadInFilteredChapterListProvider =
    FirstUnreadInFilteredChapterListFamily();

/// See also [firstUnreadInFilteredChapterList].
class FirstUnreadInFilteredChapterListFamily extends Family<Chapter?> {
  /// See also [firstUnreadInFilteredChapterList].
  const FirstUnreadInFilteredChapterListFamily();

  /// See also [firstUnreadInFilteredChapterList].
  FirstUnreadInFilteredChapterListProvider call({
    required int mangaId,
  }) {
    return FirstUnreadInFilteredChapterListProvider(
      mangaId: mangaId,
    );
  }

  @override
  FirstUnreadInFilteredChapterListProvider getProviderOverride(
    covariant FirstUnreadInFilteredChapterListProvider provider,
  ) {
    return call(
      mangaId: provider.mangaId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'firstUnreadInFilteredChapterListProvider';
}

/// See also [firstUnreadInFilteredChapterList].
class FirstUnreadInFilteredChapterListProvider
    extends AutoDisposeProvider<Chapter?> {
  /// See also [firstUnreadInFilteredChapterList].
  FirstUnreadInFilteredChapterListProvider({
    required this.mangaId,
  }) : super.internal(
          (ref) => firstUnreadInFilteredChapterList(
            ref,
            mangaId: mangaId,
          ),
          from: firstUnreadInFilteredChapterListProvider,
          name: r'firstUnreadInFilteredChapterListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$firstUnreadInFilteredChapterListHash,
          dependencies: FirstUnreadInFilteredChapterListFamily._dependencies,
          allTransitiveDependencies:
              FirstUnreadInFilteredChapterListFamily._allTransitiveDependencies,
        );

  final int mangaId;

  @override
  bool operator ==(Object other) {
    return other is FirstUnreadInFilteredChapterListProvider &&
        other.mangaId == mangaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mangaId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$getPreviousAndNextChaptersHash() =>
    r'72d82e93a696623ac8656cbcc6d2cb999ac58c6a';
typedef GetPreviousAndNextChaptersRef
    = AutoDisposeProviderRef<({Chapter? first, Chapter? second})?>;

/// See also [getPreviousAndNextChapters].
@ProviderFor(getPreviousAndNextChapters)
const getPreviousAndNextChaptersProvider = GetPreviousAndNextChaptersFamily();

/// See also [getPreviousAndNextChapters].
class GetPreviousAndNextChaptersFamily
    extends Family<({Chapter? first, Chapter? second})?> {
  /// See also [getPreviousAndNextChapters].
  const GetPreviousAndNextChaptersFamily();

  /// See also [getPreviousAndNextChapters].
  GetPreviousAndNextChaptersProvider call({
    required int mangaId,
    required String chapterIndex,
  }) {
    return GetPreviousAndNextChaptersProvider(
      mangaId: mangaId,
      chapterIndex: chapterIndex,
    );
  }

  @override
  GetPreviousAndNextChaptersProvider getProviderOverride(
    covariant GetPreviousAndNextChaptersProvider provider,
  ) {
    return call(
      mangaId: provider.mangaId,
      chapterIndex: provider.chapterIndex,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getPreviousAndNextChaptersProvider';
}

/// See also [getPreviousAndNextChapters].
class GetPreviousAndNextChaptersProvider
    extends AutoDisposeProvider<({Chapter? first, Chapter? second})?> {
  /// See also [getPreviousAndNextChapters].
  GetPreviousAndNextChaptersProvider({
    required this.mangaId,
    required this.chapterIndex,
  }) : super.internal(
          (ref) => getPreviousAndNextChapters(
            ref,
            mangaId: mangaId,
            chapterIndex: chapterIndex,
          ),
          from: getPreviousAndNextChaptersProvider,
          name: r'getPreviousAndNextChaptersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPreviousAndNextChaptersHash,
          dependencies: GetPreviousAndNextChaptersFamily._dependencies,
          allTransitiveDependencies:
              GetPreviousAndNextChaptersFamily._allTransitiveDependencies,
        );

  final int mangaId;
  final String chapterIndex;

  @override
  bool operator ==(Object other) {
    return other is GetPreviousAndNextChaptersProvider &&
        other.mangaId == mangaId &&
        other.chapterIndex == chapterIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mangaId.hashCode);
    hash = _SystemHash.combine(hash, chapterIndex.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$mangaWithIdHash() => r'aea36ab8126c57f1c73a24b1f8dc6ecbd03f25c1';

abstract class _$MangaWithId extends BuildlessAutoDisposeAsyncNotifier<Manga?> {
  late final int mangaId;

  Future<Manga?> build({
    required int mangaId,
  });
}

/// See also [MangaWithId].
@ProviderFor(MangaWithId)
const mangaWithIdProvider = MangaWithIdFamily();

/// See also [MangaWithId].
class MangaWithIdFamily extends Family<AsyncValue<Manga?>> {
  /// See also [MangaWithId].
  const MangaWithIdFamily();

  /// See also [MangaWithId].
  MangaWithIdProvider call({
    required int mangaId,
  }) {
    return MangaWithIdProvider(
      mangaId: mangaId,
    );
  }

  @override
  MangaWithIdProvider getProviderOverride(
    covariant MangaWithIdProvider provider,
  ) {
    return call(
      mangaId: provider.mangaId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'mangaWithIdProvider';
}

/// See also [MangaWithId].
class MangaWithIdProvider
    extends AutoDisposeAsyncNotifierProviderImpl<MangaWithId, Manga?> {
  /// See also [MangaWithId].
  MangaWithIdProvider({
    required this.mangaId,
  }) : super.internal(
          () => MangaWithId()..mangaId = mangaId,
          from: mangaWithIdProvider,
          name: r'mangaWithIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mangaWithIdHash,
          dependencies: MangaWithIdFamily._dependencies,
          allTransitiveDependencies:
              MangaWithIdFamily._allTransitiveDependencies,
        );

  final int mangaId;

  @override
  bool operator ==(Object other) {
    return other is MangaWithIdProvider && other.mangaId == mangaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mangaId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<Manga?> runNotifierBuild(
    covariant MangaWithId notifier,
  ) {
    return notifier.build(
      mangaId: mangaId,
    );
  }
}

String _$mangaChapterListHash() => r'cf56cf36f6e1373d708eb3099b396395ec54032d';

abstract class _$MangaChapterList
    extends BuildlessAutoDisposeAsyncNotifier<List<Chapter>?> {
  late final int mangaId;

  Future<List<Chapter>?> build({
    required int mangaId,
  });
}

/// See also [MangaChapterList].
@ProviderFor(MangaChapterList)
const mangaChapterListProvider = MangaChapterListFamily();

/// See also [MangaChapterList].
class MangaChapterListFamily extends Family<AsyncValue<List<Chapter>?>> {
  /// See also [MangaChapterList].
  const MangaChapterListFamily();

  /// See also [MangaChapterList].
  MangaChapterListProvider call({
    required int mangaId,
  }) {
    return MangaChapterListProvider(
      mangaId: mangaId,
    );
  }

  @override
  MangaChapterListProvider getProviderOverride(
    covariant MangaChapterListProvider provider,
  ) {
    return call(
      mangaId: provider.mangaId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'mangaChapterListProvider';
}

/// See also [MangaChapterList].
class MangaChapterListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    MangaChapterList, List<Chapter>?> {
  /// See also [MangaChapterList].
  MangaChapterListProvider({
    required this.mangaId,
  }) : super.internal(
          () => MangaChapterList()..mangaId = mangaId,
          from: mangaChapterListProvider,
          name: r'mangaChapterListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mangaChapterListHash,
          dependencies: MangaChapterListFamily._dependencies,
          allTransitiveDependencies:
              MangaChapterListFamily._allTransitiveDependencies,
        );

  final int mangaId;

  @override
  bool operator ==(Object other) {
    return other is MangaChapterListProvider && other.mangaId == mangaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mangaId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<List<Chapter>?> runNotifierBuild(
    covariant MangaChapterList notifier,
  ) {
    return notifier.build(
      mangaId: mangaId,
    );
  }
}

String _$mangaChapterFilterScanlatorHash() =>
    r'4d6da76af3cbbf033f1ca5fb04ea6eb7798c5820';

abstract class _$MangaChapterFilterScanlator
    extends BuildlessAutoDisposeNotifier<String> {
  late final int mangaId;

  String build({
    required int mangaId,
  });
}

/// See also [MangaChapterFilterScanlator].
@ProviderFor(MangaChapterFilterScanlator)
const mangaChapterFilterScanlatorProvider = MangaChapterFilterScanlatorFamily();

/// See also [MangaChapterFilterScanlator].
class MangaChapterFilterScanlatorFamily extends Family<String> {
  /// See also [MangaChapterFilterScanlator].
  const MangaChapterFilterScanlatorFamily();

  /// See also [MangaChapterFilterScanlator].
  MangaChapterFilterScanlatorProvider call({
    required int mangaId,
  }) {
    return MangaChapterFilterScanlatorProvider(
      mangaId: mangaId,
    );
  }

  @override
  MangaChapterFilterScanlatorProvider getProviderOverride(
    covariant MangaChapterFilterScanlatorProvider provider,
  ) {
    return call(
      mangaId: provider.mangaId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'mangaChapterFilterScanlatorProvider';
}

/// See also [MangaChapterFilterScanlator].
class MangaChapterFilterScanlatorProvider
    extends AutoDisposeNotifierProviderImpl<MangaChapterFilterScanlator,
        String> {
  /// See also [MangaChapterFilterScanlator].
  MangaChapterFilterScanlatorProvider({
    required this.mangaId,
  }) : super.internal(
          () => MangaChapterFilterScanlator()..mangaId = mangaId,
          from: mangaChapterFilterScanlatorProvider,
          name: r'mangaChapterFilterScanlatorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mangaChapterFilterScanlatorHash,
          dependencies: MangaChapterFilterScanlatorFamily._dependencies,
          allTransitiveDependencies:
              MangaChapterFilterScanlatorFamily._allTransitiveDependencies,
        );

  final int mangaId;

  @override
  bool operator ==(Object other) {
    return other is MangaChapterFilterScanlatorProvider &&
        other.mangaId == mangaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mangaId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  String runNotifierBuild(
    covariant MangaChapterFilterScanlator notifier,
  ) {
    return notifier.build(
      mangaId: mangaId,
    );
  }
}

String _$mangaChapterSortHash() => r'c8c1ab8e5211e62f7690f359ffd74d9bb134dcdd';

/// See also [MangaChapterSort].
@ProviderFor(MangaChapterSort)
final mangaChapterSortProvider =
    AutoDisposeNotifierProvider<MangaChapterSort, ChapterSort?>.internal(
  MangaChapterSort.new,
  name: r'mangaChapterSortProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mangaChapterSortHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MangaChapterSort = AutoDisposeNotifier<ChapterSort?>;
String _$mangaChapterSortDirectionHash() =>
    r'2028754952ec76ed4fabae6acea36692526c6aef';

/// See also [MangaChapterSortDirection].
@ProviderFor(MangaChapterSortDirection)
final mangaChapterSortDirectionProvider =
    AutoDisposeNotifierProvider<MangaChapterSortDirection, bool?>.internal(
  MangaChapterSortDirection.new,
  name: r'mangaChapterSortDirectionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mangaChapterSortDirectionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MangaChapterSortDirection = AutoDisposeNotifier<bool?>;
String _$mangaChapterFilterDownloadedHash() =>
    r'79ecc5ba5a1222c45b3fe90d4ab3af5d5ef45862';

/// See also [MangaChapterFilterDownloaded].
@ProviderFor(MangaChapterFilterDownloaded)
final mangaChapterFilterDownloadedProvider =
    AutoDisposeNotifierProvider<MangaChapterFilterDownloaded, bool?>.internal(
  MangaChapterFilterDownloaded.new,
  name: r'mangaChapterFilterDownloadedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mangaChapterFilterDownloadedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MangaChapterFilterDownloaded = AutoDisposeNotifier<bool?>;
String _$mangaChapterFilterUnreadHash() =>
    r'3ee19d85422eb771c4c2ce3a49e32732c56b7e02';

/// See also [MangaChapterFilterUnread].
@ProviderFor(MangaChapterFilterUnread)
final mangaChapterFilterUnreadProvider =
    AutoDisposeNotifierProvider<MangaChapterFilterUnread, bool?>.internal(
  MangaChapterFilterUnread.new,
  name: r'mangaChapterFilterUnreadProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mangaChapterFilterUnreadHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MangaChapterFilterUnread = AutoDisposeNotifier<bool?>;
String _$mangaChapterFilterBookmarkedHash() =>
    r'ce62d26fc7f1be1807028b15499f370dc2872ad2';

/// See also [MangaChapterFilterBookmarked].
@ProviderFor(MangaChapterFilterBookmarked)
final mangaChapterFilterBookmarkedProvider =
    AutoDisposeNotifierProvider<MangaChapterFilterBookmarked, bool?>.internal(
  MangaChapterFilterBookmarked.new,
  name: r'mangaChapterFilterBookmarkedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mangaChapterFilterBookmarkedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MangaChapterFilterBookmarked = AutoDisposeNotifier<bool?>;
String _$mangaCategoryListHash() => r'3fec3a544adc138ec7fbc98ad216e1b7399d0983';

abstract class _$MangaCategoryList
    extends BuildlessAutoDisposeAsyncNotifier<Map<String, Category>?> {
  late final int mangaId;

  FutureOr<Map<String, Category>?> build(
    int mangaId,
  );
}

/// See also [MangaCategoryList].
@ProviderFor(MangaCategoryList)
const mangaCategoryListProvider = MangaCategoryListFamily();

/// See also [MangaCategoryList].
class MangaCategoryListFamily
    extends Family<AsyncValue<Map<String, Category>?>> {
  /// See also [MangaCategoryList].
  const MangaCategoryListFamily();

  /// See also [MangaCategoryList].
  MangaCategoryListProvider call(
    int mangaId,
  ) {
    return MangaCategoryListProvider(
      mangaId,
    );
  }

  @override
  MangaCategoryListProvider getProviderOverride(
    covariant MangaCategoryListProvider provider,
  ) {
    return call(
      provider.mangaId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'mangaCategoryListProvider';
}

/// See also [MangaCategoryList].
class MangaCategoryListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    MangaCategoryList, Map<String, Category>?> {
  /// See also [MangaCategoryList].
  MangaCategoryListProvider(
    this.mangaId,
  ) : super.internal(
          () => MangaCategoryList()..mangaId = mangaId,
          from: mangaCategoryListProvider,
          name: r'mangaCategoryListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mangaCategoryListHash,
          dependencies: MangaCategoryListFamily._dependencies,
          allTransitiveDependencies:
              MangaCategoryListFamily._allTransitiveDependencies,
        );

  final int mangaId;

  @override
  bool operator ==(Object other) {
    return other is MangaCategoryListProvider && other.mangaId == mangaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mangaId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<Map<String, Category>?> runNotifierBuild(
    covariant MangaCategoryList notifier,
  ) {
    return notifier.build(
      mangaId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
