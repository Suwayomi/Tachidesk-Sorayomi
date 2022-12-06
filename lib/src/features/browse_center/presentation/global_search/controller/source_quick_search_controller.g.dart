// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_quick_search_controller.dart';

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

String $sourceQuickSearchMangaListHash() =>
    r'df77dd3a05f0e53944d646e57d2fb74cbc38d807';

/// See also [sourceQuickSearchMangaList].
class SourceQuickSearchMangaListProvider
    extends AutoDisposeFutureProvider<List<Manga>> {
  SourceQuickSearchMangaListProvider(
    this.sourceId, {
    this.query,
  }) : super(
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
                  : $sourceQuickSearchMangaListHash,
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

typedef SourceQuickSearchMangaListRef
    = AutoDisposeFutureProviderRef<List<Manga>>;

/// See also [sourceQuickSearchMangaList].
final sourceQuickSearchMangaListProvider = SourceQuickSearchMangaListFamily();

class SourceQuickSearchMangaListFamily extends Family<AsyncValue<List<Manga>>> {
  SourceQuickSearchMangaListFamily();

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
  AutoDisposeFutureProvider<List<Manga>> getProviderOverride(
    covariant SourceQuickSearchMangaListProvider provider,
  ) {
    return call(
      provider.sourceId,
      query: provider.query,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'sourceQuickSearchMangaListProvider';
}
