// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$processesQuickSearchHash() =>
    r'5a5c9fdc63bece1f1a98eaf3c5b761d842a5da52';

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

typedef ProcessesQuickSearchRef
    = AutoDisposeProviderRef<List<QuickSearchResult>?>;

/// See also [processesQuickSearch].
@ProviderFor(processesQuickSearch)
const processesQuickSearchProvider = ProcessesQuickSearchFamily();

/// See also [processesQuickSearch].
class ProcessesQuickSearchFamily extends Family<List<QuickSearchResult>?> {
  /// See also [processesQuickSearch].
  const ProcessesQuickSearchFamily();

  /// See also [processesQuickSearch].
  ProcessesQuickSearchProvider call({
    required BuildContext context,
  }) {
    return ProcessesQuickSearchProvider(
      context: context,
    );
  }

  @override
  ProcessesQuickSearchProvider getProviderOverride(
    covariant ProcessesQuickSearchProvider provider,
  ) {
    return call(
      context: provider.context,
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
  String? get name => r'processesQuickSearchProvider';
}

/// See also [processesQuickSearch].
class ProcessesQuickSearchProvider
    extends AutoDisposeProvider<List<QuickSearchResult>?> {
  /// See also [processesQuickSearch].
  ProcessesQuickSearchProvider({
    required this.context,
  }) : super.internal(
          (ref) => processesQuickSearch(
            ref,
            context: context,
          ),
          from: processesQuickSearchProvider,
          name: r'processesQuickSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$processesQuickSearchHash,
          dependencies: ProcessesQuickSearchFamily._dependencies,
          allTransitiveDependencies:
              ProcessesQuickSearchFamily._allTransitiveDependencies,
        );

  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is ProcessesQuickSearchProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$quickSearchQueryHash() => r'92868329e912423e36de604ccac3e6c1a96056e3';

/// See also [QuickSearchQuery].
@ProviderFor(QuickSearchQuery)
final quickSearchQueryProvider =
    AutoDisposeNotifierProvider<QuickSearchQuery, String?>.internal(
  QuickSearchQuery.new,
  name: r'quickSearchQueryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$quickSearchQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$QuickSearchQuery = AutoDisposeNotifier<String?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
