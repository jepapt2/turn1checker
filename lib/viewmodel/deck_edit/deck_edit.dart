import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:turn1checker/hooks/deck.dart';
import 'package:turn1checker/model/deck/deck.dart';

part 'deck_edit.g.dart';

@riverpod
class DeckEditNotifier extends _$DeckEditNotifier {
  @override
  Deck build(id) {
    fetchDecks(id);
    return state;
  }

  void fetchDecks(ObjectId id) {
    final deck = DeckHooks().getDeck(id);
    if (deck == null) {
      throw Exception('Deck not found');
    }
    state = deck;
  }
}
