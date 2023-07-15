import 'package:drift/drift.dart';
import 'package:turn1checker/model/db/db.dart';

class Decks extends Database {
  Future<List<Deck>> watchDecks() {
    return (select(decks)
          ..orderBy(
              [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)]))
        .get();
  }

  Future<Deck> getDeckById(int id) {
    return (select(decks)..where((t) => t.id.equals(id))).getSingle();
  }

  Future<int> createDeck(String deckName) {
    return into(decks).insert(DecksCompanion.insert(
        name: deckName, updatedAt: DateTime.now(), createdAt: DateTime.now()));
  }
}
