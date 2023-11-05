import 'package:realm/realm.dart';
import 'package:turn1checker/model/deck/deck.dart';
import 'package:turn1checker/model/realm.dart';

class DeckHooks {
  List<Deck> getDeckList() {
    final decks = realm.query<Deck>('TRUEPREDICATE SORT(updatedAt DESC)');
    return decks.toList();
  }

  createDeck(String deckName) {
    realm.write(() {
      realm.add<Deck>(
          Deck(ObjectId(), deckName, DateTime.now(), DateTime.now()));
    });
  }
}
