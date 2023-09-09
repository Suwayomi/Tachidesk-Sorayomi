// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sourceListHash() => r'80d37bd602ce3e229ac64c39743cee84d94fd1f9';

/// See also [sourceList].
@ProviderFor(sourceList)
final sourceListProvider = AutoDisposeFutureProvider<List<Source>?>.internal(
  sourceList,
  name: r'sourceListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sourceListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SourceListRef = AutoDisposeFutureProviderRef<List<Source>?>;
String _$sourceMapHash() => r'13682cd8c100d4d7ef007793b2c5ab9f97bad438';

/// See also [sourceMap].
@ProviderFor(sourceMap)
final sourceMapProvider =
    AutoDisposeProvider<AsyncValue<Map<String, List<Source>>>>.internal(
  sourceMap,
  name: r'sourceMapProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sourceMapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SourceMapRef
    = AutoDisposeProviderRef<AsyncValue<Map<String, List<Source>>>>;
String _$sourceFilterLangListHash() =>
    r'89e544ca3fb3ee2546240cb3a7a3e2085213393e';

/// See also [sourceFilterLangList].
@ProviderFor(sourceFilterLangList)
final sourceFilterLangListProvider = AutoDisposeProvider<List<String>>.internal(
  sourceFilterLangList,
  name: r'sourceFilterLangListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sourceFilterLangListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SourceFilterLangListRef = AutoDisposeProviderRef<List<String>>;
String _$sourceMapFilteredHash() => r'61d31082533cfd32f73664fd5f16c5eba09c54b8';

/// See also [sourceMapFiltered].
@ProviderFor(sourceMapFiltered)
final sourceMapFilteredProvider =
    AutoDisposeProvider<AsyncValue<Map<String, List<Source>>?>>.internal(
  sourceMapFiltered,
  name: r'sourceMapFilteredProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sourceMapFilteredHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SourceMapFilteredRef
    = AutoDisposeProviderRef<AsyncValue<Map<String, List<Source>>?>>;
String _$sourceQueryHash() => r'4e0ea33fcbc3640e4cc3ecbdf15c75923384ed69';

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

/// See also [sourceQuery].
@ProviderFor(sourceQuery)
const sourceQueryProvider = SourceQueryFamily();

/// See also [sourceQuery].
class SourceQueryFamily extends Family<List<Source>?> {
  /// See also [sourceQuery].
  const SourceQueryFamily();

  /// See also [sourceQuery].
  SourceQueryProvider call({
    String? query,
  }) {
    return SourceQueryProvider(
      query: query,
    );
  }

  @override
  SourceQueryProvider getProviderOverride(
    covariant SourceQueryProvider provider,
  ) {
    return call(
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
  String? get name => r'sourceQueryProvider';
}

/// See also [sourceQuery].
class SourceQueryProvider extends AutoDisposeProvider<List<Source>?> {
  /// See also [sourceQuery].
  SourceQueryProvider({
    String? query,
  }) : this._internal(
          (ref) => sourceQuery(
            ref as SourceQueryRef,
            query: query,
          ),
          from: sourceQueryProvider,
          name: r'sourceQueryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sourceQueryHash,
          dependencies: SourceQueryFamily._dependencies,
          allTransitiveDependencies:
              SourceQueryFamily._allTransitiveDependencies,
          query: query,
        );

  SourceQueryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String? query;

  @override
  Override overrideWith(
    List<Source>? Function(SourceQueryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SourceQueryProvider._internal(
        (ref) => create(ref as SourceQueryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<Source>?> createElement() {
    return _SourceQueryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SourceQueryProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SourceQueryRef on AutoDisposeProviderRef<List<Source>?> {
  /// The parameter `query` of this provider.
  String? get query;
}

class _SourceQueryProviderElement
    extends AutoDisposeProviderElement<List<Source>?> with SourceQueryRef {
  _SourceQueryProviderElement(super.provider);

  @override
  String? get query => (origin as SourceQueryProvider).query;
}

String _$sourceLanguageFilterHash() =>
    r'a5a8701a5d14b4c784744131113eb56cf1979dbc';

/// See also [SourceLanguageFilter].
@ProviderFor(SourceLanguageFilter)
final sourceLanguageFilterProvider =
    AutoDisposeNotifierProvider<SourceLanguageFilter, List<String>?>.internal(
  SourceLanguageFilter.new,
  name: r'sourceLanguageFilterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sourceLanguageFilterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SourceLanguageFilter = AutoDisposeNotifier<List<String>?>;
String _$sourceLastUsedHash() => r'afe764b063f80d11ed033dd6386ad8133b2c0fcd';

/// See also [SourceLastUsed].
@ProviderFor(SourceLastUsed)
final sourceLastUsedProvider =
    AutoDisposeNotifierProvider<SourceLastUsed, String?>.internal(
  SourceLastUsed.new,
  name: r'sourceLastUsedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sourceLastUsedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SourceLastUsed = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
