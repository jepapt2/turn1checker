// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_buttons.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cardButtonsNotifierHash() =>
    r'40045f3d5e6cd5bdcc5a7c76c8c9d15a9f04d618';

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

abstract class _$CardButtonsNotifier
    extends BuildlessAutoDisposeNotifier<CardButtonState> {
  late final CardButtonState? initialCardState;

  CardButtonState build({
    CardButtonState? initialCardState,
  });
}

/// See also [CardButtonsNotifier].
@ProviderFor(CardButtonsNotifier)
const cardButtonsNotifierProvider = CardButtonsNotifierFamily();

/// See also [CardButtonsNotifier].
class CardButtonsNotifierFamily extends Family<CardButtonState> {
  /// See also [CardButtonsNotifier].
  const CardButtonsNotifierFamily();

  /// See also [CardButtonsNotifier].
  CardButtonsNotifierProvider call({
    CardButtonState? initialCardState,
  }) {
    return CardButtonsNotifierProvider(
      initialCardState: initialCardState,
    );
  }

  @override
  CardButtonsNotifierProvider getProviderOverride(
    covariant CardButtonsNotifierProvider provider,
  ) {
    return call(
      initialCardState: provider.initialCardState,
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
  String? get name => r'cardButtonsNotifierProvider';
}

/// See also [CardButtonsNotifier].
class CardButtonsNotifierProvider extends AutoDisposeNotifierProviderImpl<
    CardButtonsNotifier, CardButtonState> {
  /// See also [CardButtonsNotifier].
  CardButtonsNotifierProvider({
    CardButtonState? initialCardState,
  }) : this._internal(
          () => CardButtonsNotifier()..initialCardState = initialCardState,
          from: cardButtonsNotifierProvider,
          name: r'cardButtonsNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cardButtonsNotifierHash,
          dependencies: CardButtonsNotifierFamily._dependencies,
          allTransitiveDependencies:
              CardButtonsNotifierFamily._allTransitiveDependencies,
          initialCardState: initialCardState,
        );

  CardButtonsNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initialCardState,
  }) : super.internal();

  final CardButtonState? initialCardState;

  @override
  CardButtonState runNotifierBuild(
    covariant CardButtonsNotifier notifier,
  ) {
    return notifier.build(
      initialCardState: initialCardState,
    );
  }

  @override
  Override overrideWith(CardButtonsNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CardButtonsNotifierProvider._internal(
        () => create()..initialCardState = initialCardState,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initialCardState: initialCardState,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CardButtonsNotifier, CardButtonState>
      createElement() {
    return _CardButtonsNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CardButtonsNotifierProvider &&
        other.initialCardState == initialCardState;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initialCardState.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CardButtonsNotifierRef
    on AutoDisposeNotifierProviderRef<CardButtonState> {
  /// The parameter `initialCardState` of this provider.
  CardButtonState? get initialCardState;
}

class _CardButtonsNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<CardButtonsNotifier,
        CardButtonState> with CardButtonsNotifierRef {
  _CardButtonsNotifierProviderElement(super.provider);

  @override
  CardButtonState? get initialCardState =>
      (origin as CardButtonsNotifierProvider).initialCardState;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
