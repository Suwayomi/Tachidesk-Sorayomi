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

String $MangaWithIdHash() => r'7e5bfef14dc5b0bafba380a008f3fd4ca68c958b';

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
                  : $MangaWithIdHash,
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

String $MangaChapterListHash() => r'8ed43b761da658c69465a7c3653900b67f1e972c';

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
                  : $MangaChapterListHash,
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

String $MangaChapterSortHash() => r'9b194b005f7b3c9c41cd56b7e9c902dc6d177ecb';

/// See also [MangaChapterSort].
final mangaChapterSortProvider =
    AutoDisposeNotifierProvider<MangaChapterSort, ChapterSort?>(
  MangaChapterSort.new,
  name: r'mangaChapterSortProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $MangaChapterSortHash,
);
typedef MangaChapterSortRef = AutoDisposeNotifierProviderRef<ChapterSort?>;

abstract class _$MangaChapterSort extends AutoDisposeNotifier<ChapterSort?> {
  @override
  ChapterSort? build();
}

String $MangaChapterSortDirectionHash() =>
    r'000a0c863bf83c2c751ee2fb1fb0cc62dcd77680';

/// See also [MangaChapterSortDirection].
final mangaChapterSortDirectionProvider =
    AutoDisposeNotifierProvider<MangaChapterSortDirection, bool?>(
  MangaChapterSortDirection.new,
  name: r'mangaChapterSortDirectionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $MangaChapterSortDirectionHash,
);
typedef MangaChapterSortDirectionRef = AutoDisposeNotifierProviderRef<bool?>;

abstract class _$MangaChapterSortDirection extends AutoDisposeNotifier<bool?> {
  @override
  bool? build();
}

String $MangaChapterFilterDownloadedHash() =>
    r'9f3ae2d1cda9b201ddf079822b8d6f7722ef2548';

/// See also [MangaChapterFilterDownloaded].
final mangaChapterFilterDownloadedProvider =
    AutoDisposeNotifierProvider<MangaChapterFilterDownloaded, bool?>(
  MangaChapterFilterDownloaded.new,
  name: r'mangaChapterFilterDownloadedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $MangaChapterFilterDownloadedHash,
);
typedef MangaChapterFilterDownloadedRef = AutoDisposeNotifierProviderRef<bool?>;

abstract class _$MangaChapterFilterDownloaded
    extends AutoDisposeNotifier<bool?> {
  @override
  bool? build();
}

String $MangaChapterFilterUnreadHash() =>
    r'a5dbcb2249ffe9de721e6c04efb299a823ff9e34';

/// See also [MangaChapterFilterUnread].
final mangaChapterFilterUnreadProvider =
    AutoDisposeNotifierProvider<MangaChapterFilterUnread, bool?>(
  MangaChapterFilterUnread.new,
  name: r'mangaChapterFilterUnreadProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $MangaChapterFilterUnreadHash,
);
typedef MangaChapterFilterUnreadRef = AutoDisposeNotifierProviderRef<bool?>;

abstract class _$MangaChapterFilterUnread extends AutoDisposeNotifier<bool?> {
  @override
  bool? build();
}

String $MangaChapterFilterBookmarkedHash() =>
    r'92e64218ce62b7c3010ec6d5dca7ffa0a6702eeb';

/// See also [MangaChapterFilterBookmarked].
final mangaChapterFilterBookmarkedProvider =
    AutoDisposeNotifierProvider<MangaChapterFilterBookmarked, bool?>(
  MangaChapterFilterBookmarked.new,
  name: r'mangaChapterFilterBookmarkedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $MangaChapterFilterBookmarkedHash,
);
typedef MangaChapterFilterBookmarkedRef = AutoDisposeNotifierProviderRef<bool?>;

abstract class _$MangaChapterFilterBookmarked
    extends AutoDisposeNotifier<bool?> {
  @override
  bool? build();
}

String $MangaCategoryListHash() => r'b8c64815b0fcdb2ee1f21818161e654b477affb0';

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
                  : $MangaCategoryListHash,
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

String $mangaChapterListWithFilterHash() =>
    r'60995f367091cb899dfedab8812f58878418d2fc';

/// See also [mangaChapterListWithFilter].
class MangaChapterListWithFilterProvider
    extends AutoDisposeProvider<List<Chapter>?> {
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
                  : $mangaChapterListWithFilterHash,
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

typedef MangaChapterListWithFilterRef = AutoDisposeProviderRef<List<Chapter>?>;

/// See also [mangaChapterListWithFilter].
final mangaChapterListWithFilterProvider = MangaChapterListWithFilterFamily();

class MangaChapterListWithFilterFamily extends Family<List<Chapter>?> {
  MangaChapterListWithFilterFamily();

  MangaChapterListWithFilterProvider call({
    required String mangaId,
  }) {
    return MangaChapterListWithFilterProvider(
      mangaId: mangaId,
    );
  }

  @override
  AutoDisposeProvider<List<Chapter>?> getProviderOverride(
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

String $getPreviousAndNextChaptersHash() =>
    r'8db14cff31abbea310152b38f25bcfe581efd7ab';

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
                  : $getPreviousAndNextChaptersHash,
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
