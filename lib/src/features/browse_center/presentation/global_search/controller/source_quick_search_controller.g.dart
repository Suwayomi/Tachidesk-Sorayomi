// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_quick_search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sourceQuickSearchMangaListHash() =>
    r'df77dd3a05f0e53944d646e57d2fb74cbc38d807';

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

typedef SourceQuickSearchMangaListRef
    = AutoDisposeFutureProviderRef<List<Manga>>;

/// See also [sourceQuickSearchMangaList].
@ProviderFor(sourceQuickSearchMangaList)
const sourceQuickSearchMangaListProvider = SourceQuickSearchMangaListFamily();

/// See also [sourceQuickSearchMangaList].
class SourceQuickSearchMangaListFamily extends Family<AsyncValue<List<Manga>>> {
  /// See also [sourceQuickSearchMangaList].
  const SourceQuickSearchMangaListFamily();

  /// See also [sourceQuickSearchMangaList].
  SourceQuickSearchMangaListProvider call(
    String sourceId, {
    String? query,
  }) {
    return SourceQuickSearchMangaListProvider(
      sourceId,
      query: query,
    );
  }

  @override
  SourceQuickSearchMangaListProvider getProviderOverride(
    covariant SourceQuickSearchMangaListProvider provider,
  ) {
    return call(
      provider.sourceId,
      query: provider.query,
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
  String? get name => r'sourceQuickSearchMangaListProvider';
}

/// See also [sourceQuickSearchMangaList].
class SourceQuickSearchMangaListProvider
    extends AutoDisposeFutureProvider<List<Manga>> {
  /// See also [sourceQuickSearchMangaList].
  SourceQuickSearchMangaListProvider(
    this.sourceId, {
    this.query,
  }) : super.internal(
          (ref) => sourceQuickSearchMangaList(
            ref,
            sourceId,
            query: query,
          ),
          from: sourceQuickSearchMangaListProvider,
          name: r'sourceQuickSearchMangaListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sourceQuickSearchMangaListHash,
          dependencies: SourceQuickSearchMangaListFamily._dependencies,
          allTransitiveDependencies:
              SourceQuickSearchMangaListFamily._allTransitiveDependencies,
        );

  final String sourceId;
  final String? query;

  @override
  bool operator ==(Object other) {
    return other is SourceQuickSearchMangaListProvider &&
        other.sourceId == sourceId &&
        other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sourceId.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
