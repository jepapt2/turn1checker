// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deckEdit.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deckEditNotifierHash() => r'3a2355c21e8ba8826e23a4df76e984a73c4be0a3';

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

abstract class _$DeckEditNotifier extends BuildlessAutoDisposeNotifier<Deck> {
  late final dynamic id;

  Deck build(
    dynamic id,
  );
}

/// See also [DeckEditNotifier].
@ProviderFor(DeckEditNotifier)
const deckEditNotifierProvider = DeckEditNotifierFamily();

/// See also [DeckEditNotifier].
class DeckEditNotifierFamily extends Family<Deck> {
  /// See also [DeckEditNotifier].
  const DeckEditNotifierFamily();

  /// See also [DeckEditNotifier].
  DeckEditNotifierProvider call(
    dynamic id,
  ) {
    return DeckEditNotifierProvider(
      id,
    );
  }

  @override
  DeckEditNotifierProvider getProviderOverride(
    covariant DeckEditNotifierProvider provider,
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
  String? get name => r'deckEditNotifierProvider';
}

/// See also [DeckEditNotifier].
class DeckEditNotifierProvider
    extends AutoDisposeNotifierProviderImpl<DeckEditNotifier, Deck> {
  /// See also [DeckEditNotifier].
  DeckEditNotifierProvider(
    dynamic id,
  ) : this._internal(
          () => DeckEditNotifier()..id = id,
          from: deckEditNotifierProvider,
          name: r'deckEditNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deckEditNotifierHash,
          dependencies: DeckEditNotifierFamily._dependencies,
          allTransitiveDependencies:
              DeckEditNotifierFamily._allTransitiveDependencies,
          id: id,
        );

  DeckEditNotifierProvider._internal(
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
  Deck runNotifierBuild(
    covariant DeckEditNotifier notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(DeckEditNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: DeckEditNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<DeckEditNotifier, Deck> createElement() {
    return _DeckEditNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeckEditNotifierProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeckEditNotifierRef on AutoDisposeNotifierProviderRef<Deck> {
  /// The parameter `id` of this provider.
  dynamic get id;
}

class _DeckEditNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<DeckEditNotifier, Deck>
    with DeckEditNotifierRef {
  _DeckEditNotifierProviderElement(super.provider);

  @override
  dynamic get id => (origin as DeckEditNotifierProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
