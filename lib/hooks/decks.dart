import 'package:drift/drift.dart';
import 'package:turn1checker/db/db/db.dart';

class Decks extends MyDatabase {
  Stream<List<Deck>> watchDecks() {
    return (select(decks)
          ..orderBy(
              [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)]))
        .watch();
  }
}
