import 'package:realm/realm.dart';
import 'package:turn1checker/model/deck/deck.dart';
import 'package:turn1checker/model/realm.dart';

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
}
