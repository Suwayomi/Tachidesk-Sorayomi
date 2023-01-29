// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_details_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String _$MangaWithIdHash() => r'34066d958171e4089e173a5124751043e0aad8ec';

/// See also [MangaWithId].
class MangaWithIdProvider
    extends AutoDisposeAsyncNotifierProviderImpl<MangaWithId, Manga?> {
  MangaWithIdProvider({
    required this.mangaId,
  }) : super(
          () => MangaWithId()..mangaId = mangaId,
          from: mangaWithIdProvider,
          name: r'mangaWithIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$MangaWithIdHash,
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
  FutureOr<Manga?> runNotifierBuild(
    covariant _$MangaWithId notifier,
  ) {
    return notifier.build(
      mangaId: mangaId,
    );
  }
}

typedef MangaWithIdRef = AutoDisposeAsyncNotifierProviderRef<Manga?>;

/// See also [MangaWithId].
final mangaWithIdProvider = MangaWithIdFamily();

class MangaWithIdFamily extends Family<AsyncValue<Manga?>> {
  MangaWithIdFamily();

  MangaWithIdProvider call({
    required String mangaId,
  }) {
    return MangaWithIdProvider(
      mangaId: mangaId,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<MangaWithId, Manga?> getProviderOverride(
    covariant MangaWithIdProvider provider,
  ) {
    return call(
      mangaId: provider.mangaId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'mangaWithIdProvider';
}

abstract class _$MangaWithId extends BuildlessAutoDisposeAsyncNotifier<Manga?> {
  late final String mangaId;

  FutureOr<Manga?> build({
    required String mangaId,
  });
}

String _$MangaChapterListHash() => r'e29cf9a87f5f09029b63f16b0074a4f7466d8b92';

/// See also [MangaChapterList].
class MangaChapterListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    MangaChapterList, List<Chapter>?> {
  MangaChapterListProvider({
    required this.mangaId,
  }) : super(
          () => MangaChapterList()..mangaId = mangaId,
          from: mangaChapterListProvider,
          name: r'mangaChapterListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$MangaChapterListHash,
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
  FutureOr<List<Chapter>?> runNotifierBuild(
    covariant _$MangaChapterList notifier,
  ) {
    return notifier.build(
      mangaId: mangaId,
    );
  }
}

typedef MangaChapterListRef
    = AutoDisposeAsyncNotifierProviderRef<List<Chapter>?>;

/// See also [MangaChapterList].
final mangaChapterListProvider = MangaChapterListFamily();

class MangaChapterListFamily extends Family<AsyncValue<List<Chapter>?>> {
  MangaChapterListFamily();

  MangaChapterListProvider call({
    required String mangaId,
  }) {
    return MangaChapterListProvider(
      mangaId: mangaId,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<MangaChapterList, List<Chapter>?>
      getProviderOverride(
    covariant MangaChapterListProvider provider,
  ) {
    return call(
      mangaId: provider.mangaId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'mangaChapterListProvider';
}

abstract class _$MangaChapterList
    extends BuildlessAutoDisposeAsyncNotifier<List<Chapter>?> {
  late final String mangaId;

  FutureOr<List<Chapter>?> build({
    required String mangaId,
  });
}

String _$MangaChapterSortHash() => r'5dc6e9a235babc683a798127f62e403aa6051eca';

/// See also [MangaChapterSort].
final mangaChapterSortProvider =
    AutoDisposeNotifierProvider<MangaChapterSort, ChapterSort?>(
  MangaChapterSort.new,
  name: r'mangaChapterSortProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$MangaChapterSortHash,
);
typedef MangaChapterSortRef = AutoDisposeNotifierProviderRef<ChapterSort?>;

abstract class _$MangaChapterSort extends AutoDisposeNotifier<ChapterSort?> {
  @override
  ChapterSort? build();
}

String _$MangaChapterSortDirectionHash() =>
    r'eadfe69e90a84123236e2d0420964f1d65e8f357';

/// See also [MangaChapterSortDirection].
final mangaChapterSortDirectionProvider =
    AutoDisposeNotifierProvider<MangaChapterSortDirection, bool?>(
  MangaChapterSortDirection.new,
  name: r'mangaChapterSortDirectionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$MangaChapterSortDirectionHash,
);
typedef MangaChapterSortDirectionRef = AutoDisposeNotifierProviderRef<bool?>;

abstract class _$MangaChapterSortDirection extends AutoDisposeNotifier<bool?> {
  @override
  bool? build();
}

String _$MangaChapterFilterDownloadedHash() =>
    r'e6f5e69389b85837139df8fbf0fec44468e622be';

/// See also [MangaChapterFilterDownloaded].
final mangaChapterFilterDownloadedProvider =
    AutoDisposeNotifierProvider<MangaChapterFilterDownloaded, bool?>(
  MangaChapterFilterDownloaded.new,
  name: r'mangaChapterFilterDownloadedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$MangaChapterFilterDownloadedHash,
);
typedef MangaChapterFilterDownloadedRef = AutoDisposeNotifierProviderRef<bool?>;

abstract class _$MangaChapterFilterDownloaded
    extends AutoDisposeNotifier<bool?> {
  @override
  bool? build();
}

String _$MangaChapterFilterUnreadHash() =>
    r'd95df0b4352bc44c6eaf9a7c54783f2faa5b32f4';

/// See also [MangaChapterFilterUnread].
final mangaChapterFilterUnreadProvider =
    AutoDisposeNotifierProvider<MangaChapterFilterUnread, bool?>(
  MangaChapterFilterUnread.new,
  name: r'mangaChapterFilterUnreadProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$MangaChapterFilterUnreadHash,
);
typedef MangaChapterFilterUnreadRef = AutoDisposeNotifierProviderRef<bool?>;

abstract class _$MangaChapterFilterUnread extends AutoDisposeNotifier<bool?> {
  @override
  bool? build();
}

String _$MangaChapterFilterBookmarkedHash() =>
    r'7e6335c2796527a3772dca1d79589b4fd883ae1c';

/// See also [MangaChapterFilterBookmarked].
final mangaChapterFilterBookmarkedProvider =
    AutoDisposeNotifierProvider<MangaChapterFilterBookmarked, bool?>(
  MangaChapterFilterBookmarked.new,
  name: r'mangaChapterFilterBookmarkedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$MangaChapterFilterBookmarkedHash,
);
typedef MangaChapterFilterBookmarkedRef = AutoDisposeNotifierProviderRef<bool?>;

abstract class _$MangaChapterFilterBookmarked
    extends AutoDisposeNotifier<bool?> {
  @override
  bool? build();
}

String _$MangaCategoryListHash() => r'b8c64815b0fcdb2ee1f21818161e654b477affb0';

/// See also [MangaCategoryList].
class MangaCategoryListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    MangaCategoryList, Map<String, Category>?> {
  MangaCategoryListProvider(
    this.mangaId,
  ) : super(
          () => MangaCategoryList()..mangaId = mangaId,
          from: mangaCategoryListProvider,
          name: r'mangaCategoryListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$MangaCategoryListHash,
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
    covariant _$MangaCategoryList notifier,
  ) {
    return notifier.build(
      mangaId,
    );
  }
}

typedef MangaCategoryListRef
    = AutoDisposeAsyncNotifierProviderRef<Map<String, Category>?>;

/// See also [MangaCategoryList].
final mangaCategoryListProvider = MangaCategoryListFamily();

class MangaCategoryListFamily
    extends Family<AsyncValue<Map<String, Category>?>> {
  MangaCategoryListFamily();

  MangaCategoryListProvider call(
    String mangaId,
  ) {
    return MangaCategoryListProvider(
      mangaId,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<MangaCategoryList,
      Map<String, Category>?> getProviderOverride(
    covariant MangaCategoryListProvider provider,
  ) {
    return call(
      provider.mangaId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'mangaCategoryListProvider';
}

abstract class _$MangaCategoryList
    extends BuildlessAutoDisposeAsyncNotifier<Map<String, Category>?> {
  late final String mangaId;

  FutureOr<Map<String, Category>?> build(
    String mangaId,
  );
}

String _$mangaChapterListWithFilterHash() =>
    r'a5ca407ed7a6d0989e90ce3d56614bb387597ac2';

/// See also [mangaChapterListWithFilter].
class MangaChapterListWithFilterProvider
    extends AutoDisposeProvider<AsyncValue<List<Chapter>?>> {
  MangaChapterListWithFilterProvider({
    required this.mangaId,
  }) : super(
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

typedef MangaChapterListWithFilterRef
    = AutoDisposeProviderRef<AsyncValue<List<Chapter>?>>;

/// See also [mangaChapterListWithFilter].
final mangaChapterListWithFilterProvider = MangaChapterListWithFilterFamily();

class MangaChapterListWithFilterFamily
    extends Family<AsyncValue<List<Chapter>?>> {
  MangaChapterListWithFilterFamily();

  MangaChapterListWithFilterProvider call({
    required String mangaId,
  }) {
    return MangaChapterListWithFilterProvider(
      mangaId: mangaId,
    );
  }

  @override
  AutoDisposeProvider<AsyncValue<List<Chapter>?>> getProviderOverride(
    covariant MangaChapterListWithFilterProvider provider,
  ) {
    return call(
      mangaId: provider.mangaId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'mangaChapterListWithFilterProvider';
}

String _$firstUnreadInFilteredChapterListHash() =>
    r'60d7452267e74bafdc290890223cc3a641e06305';

/// See also [firstUnreadInFilteredChapterList].
class FirstUnreadInFilteredChapterListProvider
    extends AutoDisposeProvider<Chapter?> {
  FirstUnreadInFilteredChapterListProvider({
    required this.mangaId,
  }) : super(
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

typedef FirstUnreadInFilteredChapterListRef = AutoDisposeProviderRef<Chapter?>;

/// See also [firstUnreadInFilteredChapterList].
final firstUnreadInFilteredChapterListProvider =
    FirstUnreadInFilteredChapterListFamily();

class FirstUnreadInFilteredChapterListFamily extends Family<Chapter?> {
  FirstUnreadInFilteredChapterListFamily();

  FirstUnreadInFilteredChapterListProvider call({
    required String mangaId,
  }) {
    return FirstUnreadInFilteredChapterListProvider(
      mangaId: mangaId,
    );
  }

  @override
  AutoDisposeProvider<Chapter?> getProviderOverride(
    covariant FirstUnreadInFilteredChapterListProvider provider,
  ) {
    return call(
      mangaId: provider.mangaId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'firstUnreadInFilteredChapterListProvider';
}

String _$getPreviousAndNextChaptersHash() =>
    r'c96d69daa0b66402a78052eb11af57f223c3e465';

/// See also [getPreviousAndNextChapters].
class GetPreviousAndNextChaptersProvider
    extends AutoDisposeProvider<Pair<Chapter?, Chapter?>?> {
  GetPreviousAndNextChaptersProvider({
    required this.mangaId,
    required this.chapterIndex,
  }) : super(
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

typedef GetPreviousAndNextChaptersRef
    = AutoDisposeProviderRef<Pair<Chapter?, Chapter?>?>;

/// See also [getPreviousAndNextChapters].
final getPreviousAndNextChaptersProvider = GetPreviousAndNextChaptersFamily();

class GetPreviousAndNextChaptersFamily
    extends Family<Pair<Chapter?, Chapter?>?> {
  GetPreviousAndNextChaptersFamily();

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
  AutoDisposeProvider<Pair<Chapter?, Chapter?>?> getProviderOverride(
    covariant GetPreviousAndNextChaptersProvider provider,
  ) {
    return call(
      mangaId: provider.mangaId,
      chapterIndex: provider.chapterIndex,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'getPreviousAndNextChaptersProvider';
}
