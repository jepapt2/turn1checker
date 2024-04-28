import 'dart:math';

import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:turn1checker/model/deck/deck.dart';
import 'package:turn1checker/model/realm.dart';
import 'package:turn1checker/types/card_type.dart';

class DeckHooks {
  List<Deck> getDeckList() {
    final decks = realm.query<Deck>('TRUEPREDICATE SORT(updatedAt DESC)');
    return decks.toList();
  }

  Deck? getDeck(ObjectId id) {
    final deck = realm.find<Deck>(id);
    return deck;
  }

  Deck createDeck(String deckName) {
    final deck = Deck(ObjectId(), deckName, DateTime.now(), DateTime.now());
    realm.write(() {
      realm.add<Deck>(deck);
    });
    return deck;
  }

  void saveDeck(
    Deck deck,
    void Function() update,
  ) {
    realm.write(() {
      deck.updatedAt = DateTime.now();
      update();
    });
  }

  void sortCardType(Deck deck) {
    realm.write(() {
      deck.cards.sort((a, b) {
        final aType = CardType.values.byName(a.type);
        final bType = CardType.values.byName(b.type);
        return aType.order.compareTo(bType.order);
      });
      deck.updatedAt = DateTime.now();
    });
  }

  void manualSort(
      {required Deck deck, required int oldIndex, required int newIndex}) {
    if (oldIndex < 0 ||
        oldIndex >= deck.cards.length ||
        newIndex < 0 ||
        newIndex >= deck.cards.length) {
      throw Exception('Invalid index');
    }
    realm.write(() {
      final card = deck.cards.removeAt(oldIndex);
      deck.cards.insert(newIndex, card);
      deck.updatedAt = DateTime.now();
    });
  }

  void deleteDeck(Deck deck) {
    realm.write(() {
      realm.delete(deck);
    });
  }
}
