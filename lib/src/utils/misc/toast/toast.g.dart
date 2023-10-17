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
    BuildContext context,
  ) : this._internal(
          (ref) => toast(
            ref as ToastRef,
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
          context: context,
        );

  ToastProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
  }) : super.internal();

  final BuildContext context;

  @override
  Override overrideWith(
    Toast Function(ToastRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ToastProvider._internal(
        (ref) => create(ref as ToastRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Toast> createElement() {
    return _ToastProviderElement(this);
  }

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

mixin ToastRef on AutoDisposeProviderRef<Toast> {
  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _ToastProviderElement extends AutoDisposeProviderElement<Toast>
    with ToastRef {
  _ToastProviderElement(super.provider);

  @override
  BuildContext get context => (origin as ToastProvider).context;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
