import 'package:drift/drift.dart';
import 'package:turn1checker/db/db/db.dart';

class Decks extends MyDatabase {
  Stream<List<Deck>> watchDecks() {
    return (select(decks)
          ..orderBy(
              [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)]))
        .watch();
  }

  Future<int> createDeck(String deckName) {
    return into(decks).insert(DecksCompanion.insert(
        name: deckName, updatedAt: DateTime.now(), createdAt: DateTime.now()));
  }
}
