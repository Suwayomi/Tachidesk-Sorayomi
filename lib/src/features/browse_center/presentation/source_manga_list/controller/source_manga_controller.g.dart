// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_manga_controller.dart';

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

String $SourceMangaFilterListHash() =>
    r'531b3942c3a4430a0439d920a49f5d9a1b0cf8fe';

/// See also [SourceMangaFilterList].
class SourceMangaFilterListProvider extends AutoDisposeNotifierProviderImpl<
    SourceMangaFilterList, AsyncValue<List<Filter>?>> {
  SourceMangaFilterListProvider(
    this.sourceId, {
    this.filter,
  }) : super(
          () => SourceMangaFilterList()
            ..sourceId = sourceId
            ..filter = filter,
          from: sourceMangaFilterListProvider,
          name: r'sourceMangaFilterListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $SourceMangaFilterListHash,
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
    covariant _$SourceMangaFilterList notifier,
  ) {
    return notifier.build(
      sourceId,
      filter: filter,
    );
  }
}

typedef SourceMangaFilterListRef
    = AutoDisposeNotifierProviderRef<AsyncValue<List<Filter>?>>;

/// See also [SourceMangaFilterList].
final sourceMangaFilterListProvider = SourceMangaFilterListFamily();

class SourceMangaFilterListFamily extends Family<AsyncValue<List<Filter>?>> {
  SourceMangaFilterListFamily();

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
  AutoDisposeNotifierProviderImpl<SourceMangaFilterList,
      AsyncValue<List<Filter>?>> getProviderOverride(
    covariant SourceMangaFilterListProvider provider,
  ) {
    return call(
      provider.sourceId,
      filter: provider.filter,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'sourceMangaFilterListProvider';
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

String $SourceDisplayModeHash() => r'6c61e478095507fe31213a1d671f0f6e20229131';

/// See also [SourceDisplayMode].
final sourceDisplayModeProvider =
    AutoDisposeNotifierProvider<SourceDisplayMode, DisplayMode?>(
  SourceDisplayMode.new,
  name: r'sourceDisplayModeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $SourceDisplayModeHash,
);
typedef SourceDisplayModeRef = AutoDisposeNotifierProviderRef<DisplayMode?>;

abstract class _$SourceDisplayMode extends AutoDisposeNotifier<DisplayMode?> {
  @override
  DisplayMode? build();
}

String $sourceHash() => r'4b9780685f4d7657fd9d31eb5b535275b9896577';

/// See also [source].
class SourceProvider extends AutoDisposeFutureProvider<Source?> {
  SourceProvider(
    this.sourceId,
  ) : super(
          (ref) => source(
            ref,
            sourceId,
          ),
          from: sourceProvider,
          name: r'sourceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $sourceHash,
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

typedef SourceRef = AutoDisposeFutureProviderRef<Source?>;

/// See also [source].
final sourceProvider = SourceFamily();

class SourceFamily extends Family<AsyncValue<Source?>> {
  SourceFamily();

  SourceProvider call(
    String sourceId,
  ) {
    return SourceProvider(
      sourceId,
    );
  }

  @override
  AutoDisposeFutureProvider<Source?> getProviderOverride(
    covariant SourceProvider provider,
  ) {
    return call(
      provider.sourceId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'sourceProvider';
}

String $baseSourceMangaFilterListHash() =>
    r'a576d9d103923d24ee4fd66836dfe07e0b896a5a';

/// See also [baseSourceMangaFilterList].
class BaseSourceMangaFilterListProvider
    extends AutoDisposeFutureProvider<List<Filter>?> {
  BaseSourceMangaFilterListProvider(
    this.sourceId,
  ) : super(
          (ref) => baseSourceMangaFilterList(
            ref,
            sourceId,
          ),
          from: baseSourceMangaFilterListProvider,
          name: r'baseSourceMangaFilterListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $baseSourceMangaFilterListHash,
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

typedef BaseSourceMangaFilterListRef
    = AutoDisposeFutureProviderRef<List<Filter>?>;

/// See also [baseSourceMangaFilterList].
final baseSourceMangaFilterListProvider = BaseSourceMangaFilterListFamily();

class BaseSourceMangaFilterListFamily
    extends Family<AsyncValue<List<Filter>?>> {
  BaseSourceMangaFilterListFamily();

  BaseSourceMangaFilterListProvider call(
    String sourceId,
  ) {
    return BaseSourceMangaFilterListProvider(
      sourceId,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Filter>?> getProviderOverride(
    covariant BaseSourceMangaFilterListProvider provider,
  ) {
    return call(
      provider.sourceId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'baseSourceMangaFilterListProvider';
}
