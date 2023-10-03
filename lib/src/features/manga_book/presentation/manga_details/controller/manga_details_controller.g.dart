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
    required int mangaId,
  }) : this._internal(
          (ref) => mangaScanlatorList(
            ref as MangaScanlatorListRef,
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
          mangaId: mangaId,
        );

  MangaScanlatorListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mangaId,
  }) : super.internal();

  final int mangaId;

  @override
  Override overrideWith(
    Set<String> Function(MangaScanlatorListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MangaScanlatorListProvider._internal(
        (ref) => create(ref as MangaScanlatorListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mangaId: mangaId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Set<String>> createElement() {
    return _MangaScanlatorListProviderElement(this);
  }

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

mixin MangaScanlatorListRef on AutoDisposeProviderRef<Set<String>> {
  /// The parameter `mangaId` of this provider.
  int get mangaId;
}

class _MangaScanlatorListProviderElement
    extends AutoDisposeProviderElement<Set<String>> with MangaScanlatorListRef {
  _MangaScanlatorListProviderElement(super.provider);

  @override
  int get mangaId => (origin as MangaScanlatorListProvider).mangaId;
}

String _$mangaChapterListWithFilterHash() =>
    r'd8e95ee63920e7ee5acf15deda7b9d795ca452c9';

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
    required int mangaId,
  }) : this._internal(
          (ref) => mangaChapterListWithFilter(
            ref as MangaChapterListWithFilterRef,
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
          mangaId: mangaId,
        );

  MangaChapterListWithFilterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mangaId,
  }) : super.internal();

  final int mangaId;

  @override
  Override overrideWith(
    AsyncValue<List<Chapter>?> Function(MangaChapterListWithFilterRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MangaChapterListWithFilterProvider._internal(
        (ref) => create(ref as MangaChapterListWithFilterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mangaId: mangaId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<AsyncValue<List<Chapter>?>> createElement() {
    return _MangaChapterListWithFilterProviderElement(this);
  }

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

mixin MangaChapterListWithFilterRef
    on AutoDisposeProviderRef<AsyncValue<List<Chapter>?>> {
  /// The parameter `mangaId` of this provider.
  int get mangaId;
}

class _MangaChapterListWithFilterProviderElement
    extends AutoDisposeProviderElement<AsyncValue<List<Chapter>?>>
    with MangaChapterListWithFilterRef {
  _MangaChapterListWithFilterProviderElement(super.provider);

  @override
  int get mangaId => (origin as MangaChapterListWithFilterProvider).mangaId;
}

String _$firstUnreadInFilteredChapterListHash() =>
    r'ed13a5108da7bb4f9224899075348531da8a118e';

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
    required int mangaId,
  }) : this._internal(
          (ref) => firstUnreadInFilteredChapterList(
            ref as FirstUnreadInFilteredChapterListRef,
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
          mangaId: mangaId,
        );

  FirstUnreadInFilteredChapterListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mangaId,
  }) : super.internal();

  final int mangaId;

  @override
  Override overrideWith(
    Chapter? Function(FirstUnreadInFilteredChapterListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FirstUnreadInFilteredChapterListProvider._internal(
        (ref) => create(ref as FirstUnreadInFilteredChapterListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mangaId: mangaId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Chapter?> createElement() {
    return _FirstUnreadInFilteredChapterListProviderElement(this);
  }

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

mixin FirstUnreadInFilteredChapterListRef on AutoDisposeProviderRef<Chapter?> {
  /// The parameter `mangaId` of this provider.
  int get mangaId;
}

class _FirstUnreadInFilteredChapterListProviderElement
    extends AutoDisposeProviderElement<Chapter?>
    with FirstUnreadInFilteredChapterListRef {
  _FirstUnreadInFilteredChapterListProviderElement(super.provider);

  @override
  int get mangaId =>
      (origin as FirstUnreadInFilteredChapterListProvider).mangaId;
}

String _$getPreviousAndNextChaptersHash() =>
    r'72d82e93a696623ac8656cbcc6d2cb999ac58c6a';

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
    required int mangaId,
    required String chapterIndex,
  }) : this._internal(
          (ref) => getPreviousAndNextChapters(
            ref as GetPreviousAndNextChaptersRef,
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
          mangaId: mangaId,
          chapterIndex: chapterIndex,
        );

  GetPreviousAndNextChaptersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mangaId,
    required this.chapterIndex,
  }) : super.internal();

  final int mangaId;
  final String chapterIndex;

  @override
  Override overrideWith(
    ({Chapter? first, Chapter? second})? Function(
            GetPreviousAndNextChaptersRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPreviousAndNextChaptersProvider._internal(
        (ref) => create(ref as GetPreviousAndNextChaptersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mangaId: mangaId,
        chapterIndex: chapterIndex,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<({Chapter? first, Chapter? second})?>
      createElement() {
    return _GetPreviousAndNextChaptersProviderElement(this);
  }

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

mixin GetPreviousAndNextChaptersRef
    on AutoDisposeProviderRef<({Chapter? first, Chapter? second})?> {
  /// The parameter `mangaId` of this provider.
  int get mangaId;

  /// The parameter `chapterIndex` of this provider.
  String get chapterIndex;
}

class _GetPreviousAndNextChaptersProviderElement
    extends AutoDisposeProviderElement<({Chapter? first, Chapter? second})?>
    with GetPreviousAndNextChaptersRef {
  _GetPreviousAndNextChaptersProviderElement(super.provider);

  @override
  int get mangaId => (origin as GetPreviousAndNextChaptersProvider).mangaId;
  @override
  String get chapterIndex =>
      (origin as GetPreviousAndNextChaptersProvider).chapterIndex;
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
    required int mangaId,
  }) : this._internal(
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
          mangaId: mangaId,
        );

  MangaWithIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mangaId,
  }) : super.internal();

  final int mangaId;

  @override
  Future<Manga?> runNotifierBuild(
    covariant MangaWithId notifier,
  ) {
    return notifier.build(
      mangaId: mangaId,
    );
  }

  @override
  Override overrideWith(MangaWithId Function() create) {
    return ProviderOverride(
      origin: this,
      override: MangaWithIdProvider._internal(
        () => create()..mangaId = mangaId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mangaId: mangaId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MangaWithId, Manga?> createElement() {
    return _MangaWithIdProviderElement(this);
  }

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
}

mixin MangaWithIdRef on AutoDisposeAsyncNotifierProviderRef<Manga?> {
  /// The parameter `mangaId` of this provider.
  int get mangaId;
}

class _MangaWithIdProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MangaWithId, Manga?>
    with MangaWithIdRef {
  _MangaWithIdProviderElement(super.provider);

  @override
  int get mangaId => (origin as MangaWithIdProvider).mangaId;
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
    required int mangaId,
  }) : this._internal(
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
          mangaId: mangaId,
        );

  MangaChapterListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mangaId,
  }) : super.internal();

  final int mangaId;

  @override
  Future<List<Chapter>?> runNotifierBuild(
    covariant MangaChapterList notifier,
  ) {
    return notifier.build(
      mangaId: mangaId,
    );
  }

  @override
  Override overrideWith(MangaChapterList Function() create) {
    return ProviderOverride(
      origin: this,
      override: MangaChapterListProvider._internal(
        () => create()..mangaId = mangaId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mangaId: mangaId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MangaChapterList, List<Chapter>?>
      createElement() {
    return _MangaChapterListProviderElement(this);
  }

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
}

mixin MangaChapterListRef
    on AutoDisposeAsyncNotifierProviderRef<List<Chapter>?> {
  /// The parameter `mangaId` of this provider.
  int get mangaId;
}

class _MangaChapterListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MangaChapterList,
        List<Chapter>?> with MangaChapterListRef {
  _MangaChapterListProviderElement(super.provider);

  @override
  int get mangaId => (origin as MangaChapterListProvider).mangaId;
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
    required int mangaId,
  }) : this._internal(
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
          mangaId: mangaId,
        );

  MangaChapterFilterScanlatorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mangaId,
  }) : super.internal();

  final int mangaId;

  @override
  String runNotifierBuild(
    covariant MangaChapterFilterScanlator notifier,
  ) {
    return notifier.build(
      mangaId: mangaId,
    );
  }

  @override
  Override overrideWith(MangaChapterFilterScanlator Function() create) {
    return ProviderOverride(
      origin: this,
      override: MangaChapterFilterScanlatorProvider._internal(
        () => create()..mangaId = mangaId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mangaId: mangaId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<MangaChapterFilterScanlator, String>
      createElement() {
    return _MangaChapterFilterScanlatorProviderElement(this);
  }

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
}

mixin MangaChapterFilterScanlatorRef on AutoDisposeNotifierProviderRef<String> {
  /// The parameter `mangaId` of this provider.
  int get mangaId;
}

class _MangaChapterFilterScanlatorProviderElement
    extends AutoDisposeNotifierProviderElement<MangaChapterFilterScanlator,
        String> with MangaChapterFilterScanlatorRef {
  _MangaChapterFilterScanlatorProviderElement(super.provider);

  @override
  int get mangaId => (origin as MangaChapterFilterScanlatorProvider).mangaId;
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
    int mangaId,
  ) : this._internal(
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
          mangaId: mangaId,
        );

  MangaCategoryListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mangaId,
  }) : super.internal();

  final int mangaId;

  @override
  FutureOr<Map<String, Category>?> runNotifierBuild(
    covariant MangaCategoryList notifier,
  ) {
    return notifier.build(
      mangaId,
    );
  }

  @override
  Override overrideWith(MangaCategoryList Function() create) {
    return ProviderOverride(
      origin: this,
      override: MangaCategoryListProvider._internal(
        () => create()..mangaId = mangaId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mangaId: mangaId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MangaCategoryList,
      Map<String, Category>?> createElement() {
    return _MangaCategoryListProviderElement(this);
  }

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
}

mixin MangaCategoryListRef
    on AutoDisposeAsyncNotifierProviderRef<Map<String, Category>?> {
  /// The parameter `mangaId` of this provider.
  int get mangaId;
}

class _MangaCategoryListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MangaCategoryList,
        Map<String, Category>?> with MangaCategoryListRef {
  _MangaCategoryListProviderElement(super.provider);

  @override
  int get mangaId => (origin as MangaCategoryListProvider).mangaId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
