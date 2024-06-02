// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$purchaseNotifierHash() => r'd213a6cf1d1fbe7676fa717a22efc87412e89bb9';

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

abstract class _$PurchaseNotifier
    extends BuildlessAutoDisposeNotifier<AsyncValue<Offerings>> {
  late final BuildContext context;

  AsyncValue<Offerings> build(
    BuildContext context,
  );
}

/// See also [PurchaseNotifier].
@ProviderFor(PurchaseNotifier)
const purchaseNotifierProvider = PurchaseNotifierFamily();

/// See also [PurchaseNotifier].
class PurchaseNotifierFamily extends Family<AsyncValue<Offerings>> {
  /// See also [PurchaseNotifier].
  const PurchaseNotifierFamily();

  /// See also [PurchaseNotifier].
  PurchaseNotifierProvider call(
    BuildContext context,
  ) {
    return PurchaseNotifierProvider(
      context,
    );
  }

  @override
  PurchaseNotifierProvider getProviderOverride(
    covariant PurchaseNotifierProvider provider,
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
  String? get name => r'purchaseNotifierProvider';
}

/// See also [PurchaseNotifier].
class PurchaseNotifierProvider extends AutoDisposeNotifierProviderImpl<
    PurchaseNotifier, AsyncValue<Offerings>> {
  /// See also [PurchaseNotifier].
  PurchaseNotifierProvider(
    BuildContext context,
  ) : this._internal(
          () => PurchaseNotifier()..context = context,
          from: purchaseNotifierProvider,
          name: r'purchaseNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$purchaseNotifierHash,
          dependencies: PurchaseNotifierFamily._dependencies,
          allTransitiveDependencies:
              PurchaseNotifierFamily._allTransitiveDependencies,
          context: context,
        );

  PurchaseNotifierProvider._internal(
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
  AsyncValue<Offerings> runNotifierBuild(
    covariant PurchaseNotifier notifier,
  ) {
    return notifier.build(
      context,
    );
  }

  @override
  Override overrideWith(PurchaseNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: PurchaseNotifierProvider._internal(
        () => create()..context = context,
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
  AutoDisposeNotifierProviderElement<PurchaseNotifier, AsyncValue<Offerings>>
      createElement() {
    return _PurchaseNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PurchaseNotifierProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PurchaseNotifierRef
    on AutoDisposeNotifierProviderRef<AsyncValue<Offerings>> {
  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _PurchaseNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<PurchaseNotifier,
        AsyncValue<Offerings>> with PurchaseNotifierRef {
  _PurchaseNotifierProviderElement(super.provider);

  @override
  BuildContext get context => (origin as PurchaseNotifierProvider).context;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
