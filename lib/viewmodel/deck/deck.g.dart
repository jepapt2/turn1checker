// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deckNotifierHash() => r'dbc3cfdb33820da7c383f691313756a98fa1a647';

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

abstract class _$DeckNotifier extends BuildlessAutoDisposeNotifier<DeckState> {
  late final dynamic id;

  DeckState build(
    dynamic id,
  );
}

/// See also [DeckNotifier].
@ProviderFor(DeckNotifier)
const deckNotifierProvider = DeckNotifierFamily();

/// See also [DeckNotifier].
class DeckNotifierFamily extends Family<DeckState> {
  /// See also [DeckNotifier].
  const DeckNotifierFamily();

  /// See also [DeckNotifier].
  DeckNotifierProvider call(
    dynamic id,
  ) {
    return DeckNotifierProvider(
      id,
    );
  }

  @override
  DeckNotifierProvider getProviderOverride(
    covariant DeckNotifierProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'deckNotifierProvider';
}

/// See also [DeckNotifier].
class DeckNotifierProvider
    extends AutoDisposeNotifierProviderImpl<DeckNotifier, DeckState> {
  /// See also [DeckNotifier].
  DeckNotifierProvider(
    dynamic id,
  ) : this._internal(
          () => DeckNotifier()..id = id,
          from: deckNotifierProvider,
          name: r'deckNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deckNotifierHash,
          dependencies: DeckNotifierFamily._dependencies,
          allTransitiveDependencies:
              DeckNotifierFamily._allTransitiveDependencies,
          id: id,
        );

  DeckNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final dynamic id;

  @override
  DeckState runNotifierBuild(
    covariant DeckNotifier notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(DeckNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: DeckNotifierProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<DeckNotifier, DeckState> createElement() {
    return _DeckNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeckNotifierProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeckNotifierRef on AutoDisposeNotifierProviderRef<DeckState> {
  /// The parameter `id` of this provider.
  dynamic get id;
}

class _DeckNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<DeckNotifier, DeckState>
    with DeckNotifierRef {
  _DeckNotifierProviderElement(super.provider);

  @override
  dynamic get id => (origin as DeckNotifierProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
