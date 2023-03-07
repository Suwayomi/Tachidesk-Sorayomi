// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_details_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mangaChapterListWithFilterHash() =>
    r'c38f5462d03c80c543f83d2f6910fd7ecc0e1436';

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
    required String mangaId,
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

  final String mangaId;

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
    r'60d7452267e74bafdc290890223cc3a641e06305';
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
    required String mangaId,
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

  final String mangaId;

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
    r'c96d69daa0b66402a78052eb11af57f223c3e465';
typedef GetPreviousAndNextChaptersRef
    = AutoDisposeProviderRef<Pair<Chapter?, Chapter?>?>;

/// See also [getPreviousAndNextChapters].
@ProviderFor(getPreviousAndNextChapters)
const getPreviousAndNextChaptersProvider = GetPreviousAndNextChaptersFamily();

/// See also [getPreviousAndNextChapters].
class GetPreviousAndNextChaptersFamily
    extends Family<Pair<Chapter?, Chapter?>?> {
  /// See also [getPreviousAndNextChapters].
  const GetPreviousAndNextChaptersFamily();

  /// See also [getPreviousAndNextChapters].
  GetPreviousAndNextChaptersProvider call({
    required String mangaId,
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
    extends AutoDisposeProvider<Pair<Chapter?, Chapter?>?> {
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

  final String mangaId;
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

String _$mangaWithIdHash() => r'34066d958171e4089e173a5124751043e0aad8ec';

abstract class _$MangaWithId extends BuildlessAutoDisposeAsyncNotifier<Manga?> {
  late final String mangaId;

  Future<Manga?> build({
    required String mangaId,
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
    required String mangaId,
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

  final String mangaId;

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

String _$mangaChapterListHash() => r'e29cf9a87f5f09029b63f16b0074a4f7466d8b92';

abstract class _$MangaChapterList
    extends BuildlessAutoDisposeAsyncNotifier<List<Chapter>?> {
  late final String mangaId;

  Future<List<Chapter>?> build({
    required String mangaId,
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
    required String mangaId,
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

  final String mangaId;

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
String _$mangaCategoryListHash() => r'b8c64815b0fcdb2ee1f21818161e654b477affb0';

abstract class _$MangaCategoryList
    extends BuildlessAutoDisposeAsyncNotifier<Map<String, Category>?> {
  late final String mangaId;

  FutureOr<Map<String, Category>?> build(
    String mangaId,
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
    String mangaId,
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

  final String mangaId;

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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
