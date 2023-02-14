// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_manga_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sourceMangaFilterListHash() =>
    r'531b3942c3a4430a0439d920a49f5d9a1b0cf8fe';

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

abstract class _$SourceMangaFilterList
    extends BuildlessAutoDisposeNotifier<AsyncValue<List<Filter>?>> {
  late final String sourceId;
  late final List<Filter>? filter;

  AsyncValue<List<Filter>?> build(
    String sourceId, {
    List<Filter>? filter,
  });
}

/// See also [SourceMangaFilterList].
@ProviderFor(SourceMangaFilterList)
const sourceMangaFilterListProvider = SourceMangaFilterListFamily();

/// See also [SourceMangaFilterList].
class SourceMangaFilterListFamily extends Family<AsyncValue<List<Filter>?>> {
  /// See also [SourceMangaFilterList].
  const SourceMangaFilterListFamily();

  /// See also [SourceMangaFilterList].
  SourceMangaFilterListProvider call(
    String sourceId, {
    List<Filter>? filter,
  }) {
    return SourceMangaFilterListProvider(
      sourceId,
      filter: filter,
    );
  }

  @override
  SourceMangaFilterListProvider getProviderOverride(
    covariant SourceMangaFilterListProvider provider,
  ) {
    return call(
      provider.sourceId,
      filter: provider.filter,
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
  String? get name => r'sourceMangaFilterListProvider';
}

/// See also [SourceMangaFilterList].
class SourceMangaFilterListProvider extends AutoDisposeNotifierProviderImpl<
    SourceMangaFilterList, AsyncValue<List<Filter>?>> {
  /// See also [SourceMangaFilterList].
  SourceMangaFilterListProvider(
    this.sourceId, {
    this.filter,
  }) : super.internal(
          () => SourceMangaFilterList()
            ..sourceId = sourceId
            ..filter = filter,
          from: sourceMangaFilterListProvider,
          name: r'sourceMangaFilterListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sourceMangaFilterListHash,
          dependencies: SourceMangaFilterListFamily._dependencies,
          allTransitiveDependencies:
              SourceMangaFilterListFamily._allTransitiveDependencies,
        );

  final String sourceId;
  final List<Filter>? filter;

  @override
  bool operator ==(Object other) {
    return other is SourceMangaFilterListProvider &&
        other.sourceId == sourceId &&
        other.filter == filter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sourceId.hashCode);
    hash = _SystemHash.combine(hash, filter.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  AsyncValue<List<Filter>?> runNotifierBuild(
    covariant SourceMangaFilterList notifier,
  ) {
    return notifier.build(
      sourceId,
      filter: filter,
    );
  }
}

String _$sourceDisplayModeHash() => r'6c61e478095507fe31213a1d671f0f6e20229131';

/// See also [SourceDisplayMode].
@ProviderFor(SourceDisplayMode)
final sourceDisplayModeProvider =
    AutoDisposeNotifierProvider<SourceDisplayMode, DisplayMode?>.internal(
  SourceDisplayMode.new,
  name: r'sourceDisplayModeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sourceDisplayModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SourceDisplayMode = AutoDisposeNotifier<DisplayMode?>;
String _$sourceHash() => r'02ebbe306c0a96174aa221c8e90e9f2c96f398ee';
typedef SourceRef = AutoDisposeFutureProviderRef<Source?>;

/// See also [source].
@ProviderFor(source)
const sourceProvider = SourceFamily();

/// See also [source].
class SourceFamily extends Family<AsyncValue<Source?>> {
  /// See also [source].
  const SourceFamily();

  /// See also [source].
  SourceProvider call(
    String sourceId,
  ) {
    return SourceProvider(
      sourceId,
    );
  }

  @override
  SourceProvider getProviderOverride(
    covariant SourceProvider provider,
  ) {
    return call(
      provider.sourceId,
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
  String? get name => r'sourceProvider';
}

/// See also [source].
class SourceProvider extends AutoDisposeFutureProvider<Source?> {
  /// See also [source].
  SourceProvider(
    this.sourceId,
  ) : super.internal(
          (ref) => source(
            ref,
            sourceId,
          ),
          from: sourceProvider,
          name: r'sourceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sourceHash,
          dependencies: SourceFamily._dependencies,
          allTransitiveDependencies: SourceFamily._allTransitiveDependencies,
        );

  final String sourceId;

  @override
  bool operator ==(Object other) {
    return other is SourceProvider && other.sourceId == sourceId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sourceId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$baseSourceMangaFilterListHash() =>
    r'21b6028eb4e3ea54f9708d2faf1c73f21129721e';
typedef BaseSourceMangaFilterListRef
    = AutoDisposeFutureProviderRef<List<Filter>?>;

/// See also [baseSourceMangaFilterList].
@ProviderFor(baseSourceMangaFilterList)
const baseSourceMangaFilterListProvider = BaseSourceMangaFilterListFamily();

/// See also [baseSourceMangaFilterList].
class BaseSourceMangaFilterListFamily
    extends Family<AsyncValue<List<Filter>?>> {
  /// See also [baseSourceMangaFilterList].
  const BaseSourceMangaFilterListFamily();

  /// See also [baseSourceMangaFilterList].
  BaseSourceMangaFilterListProvider call(
    String sourceId,
  ) {
    return BaseSourceMangaFilterListProvider(
      sourceId,
    );
  }

  @override
  BaseSourceMangaFilterListProvider getProviderOverride(
    covariant BaseSourceMangaFilterListProvider provider,
  ) {
    return call(
      provider.sourceId,
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
  String? get name => r'baseSourceMangaFilterListProvider';
}

/// See also [baseSourceMangaFilterList].
class BaseSourceMangaFilterListProvider
    extends AutoDisposeFutureProvider<List<Filter>?> {
  /// See also [baseSourceMangaFilterList].
  BaseSourceMangaFilterListProvider(
    this.sourceId,
  ) : super.internal(
          (ref) => baseSourceMangaFilterList(
            ref,
            sourceId,
          ),
          from: baseSourceMangaFilterListProvider,
          name: r'baseSourceMangaFilterListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$baseSourceMangaFilterListHash,
          dependencies: BaseSourceMangaFilterListFamily._dependencies,
          allTransitiveDependencies:
              BaseSourceMangaFilterListFamily._allTransitiveDependencies,
        );

  final String sourceId;

  @override
  bool operator ==(Object other) {
    return other is BaseSourceMangaFilterListProvider &&
        other.sourceId == sourceId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sourceId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
