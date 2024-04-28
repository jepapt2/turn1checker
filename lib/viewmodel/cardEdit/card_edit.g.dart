// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_edit.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cardEditNotifierHash() => r'6321e549f01d85c042535a08d1130e673499594d';

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

abstract class _$CardEditNotifier
    extends BuildlessAutoDisposeNotifier<CardButtonState> {
  late final ObjectId deckId;
  late final ObjectId? cardId;

  CardButtonState build({
    required ObjectId deckId,
    ObjectId? cardId,
  });
}

/// See also [CardEditNotifier].
@ProviderFor(CardEditNotifier)
const cardEditNotifierProvider = CardEditNotifierFamily();

/// See also [CardEditNotifier].
class CardEditNotifierFamily extends Family<CardButtonState> {
  /// See also [CardEditNotifier].
  const CardEditNotifierFamily();

  /// See also [CardEditNotifier].
  CardEditNotifierProvider call({
    required ObjectId deckId,
    ObjectId? cardId,
  }) {
    return CardEditNotifierProvider(
      deckId: deckId,
      cardId: cardId,
    );
  }

  @override
  CardEditNotifierProvider getProviderOverride(
    covariant CardEditNotifierProvider provider,
  ) {
    return call(
      deckId: provider.deckId,
      cardId: provider.cardId,
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
  String? get name => r'cardEditNotifierProvider';
}

/// See also [CardEditNotifier].
class CardEditNotifierProvider
    extends AutoDisposeNotifierProviderImpl<CardEditNotifier, CardButtonState> {
  /// See also [CardEditNotifier].
  CardEditNotifierProvider({
    required ObjectId deckId,
    ObjectId? cardId,
  }) : this._internal(
          () => CardEditNotifier()
            ..deckId = deckId
            ..cardId = cardId,
          from: cardEditNotifierProvider,
          name: r'cardEditNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cardEditNotifierHash,
          dependencies: CardEditNotifierFamily._dependencies,
          allTransitiveDependencies:
              CardEditNotifierFamily._allTransitiveDependencies,
          deckId: deckId,
          cardId: cardId,
        );

  CardEditNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.deckId,
    required this.cardId,
  }) : super.internal();

  final ObjectId deckId;
  final ObjectId? cardId;

  @override
  CardButtonState runNotifierBuild(
    covariant CardEditNotifier notifier,
  ) {
    return notifier.build(
      deckId: deckId,
      cardId: cardId,
    );
  }

  @override
  Override overrideWith(CardEditNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CardEditNotifierProvider._internal(
        () => create()
          ..deckId = deckId
          ..cardId = cardId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        deckId: deckId,
        cardId: cardId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CardEditNotifier, CardButtonState>
      createElement() {
    return _CardEditNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CardEditNotifierProvider &&
        other.deckId == deckId &&
        other.cardId == cardId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, deckId.hashCode);
    hash = _SystemHash.combine(hash, cardId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CardEditNotifierRef on AutoDisposeNotifierProviderRef<CardButtonState> {
  /// The parameter `deckId` of this provider.
  ObjectId get deckId;

  /// The parameter `cardId` of this provider.
  ObjectId? get cardId;
}

class _CardEditNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<CardEditNotifier,
        CardButtonState> with CardEditNotifierRef {
  _CardEditNotifierProviderElement(super.provider);

  @override
  ObjectId get deckId => (origin as CardEditNotifierProvider).deckId;
  @override
  ObjectId? get cardId => (origin as CardEditNotifierProvider).cardId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
