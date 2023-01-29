// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toast.dart';

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

String _$toastHash() => r'6bc9df511e9180eea4d509e57fdd4eed4c062779';

/// See also [toast].
class ToastProvider extends AutoDisposeProvider<Toast> {
  ToastProvider(
    this.context,
  ) : super(
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

typedef ToastRef = AutoDisposeProviderRef<Toast>;

/// See also [toast].
final toastProvider = ToastFamily();

class ToastFamily extends Family<Toast> {
  ToastFamily();

  ToastProvider call(
    BuildContext context,
  ) {
    return ToastProvider(
      context,
    );
  }

  @override
  AutoDisposeProvider<Toast> getProviderOverride(
    covariant ToastProvider provider,
  ) {
    return call(
      provider.context,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'toastProvider';
}
