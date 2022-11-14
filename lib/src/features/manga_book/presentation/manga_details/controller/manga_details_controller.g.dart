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

String $MangaWithIdHash() => r'c7fc45e600a9d4dba026ee3ed717c501d426c5d5';

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

String $MangaChapterListHash() => r'ed8032ad7accdea6ba387f9b3b4d45063c350526';

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
