// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toast.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$toastHash() => r'6bc9df511e9180eea4d509e57fdd4eed4c062779';

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

typedef ToastRef = AutoDisposeProviderRef<Toast>;

/// See also [toast].
@ProviderFor(toast)
const toastProvider = ToastFamily();

/// See also [toast].
class ToastFamily extends Family<Toast> {
  /// See also [toast].
  const ToastFamily();

  /// See also [toast].
  ToastProvider call(
    BuildContext context,
  ) {
    return ToastProvider(
      context,
    );
  }

  @override
  ToastProvider getProviderOverride(
    covariant ToastProvider provider,
  ) {
    return call(
      provider.context,
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
  String? get name => r'toastProvider';
}

/// See also [toast].
class ToastProvider extends AutoDisposeProvider<Toast> {
  /// See also [toast].
  ToastProvider(
    this.context,
  ) : super.internal(
          (ref) => toast(
            ref,
            context,
          ),
          from: toastProvider,
          name: r'toastProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$toastHash,
          dependencies: ToastFamily._dependencies,
          allTransitiveDependencies: ToastFamily._allTransitiveDependencies,
        );

  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is ToastProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
