import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:turn1checker/hooks/deck.dart';
import 'package:turn1checker/model/deck/deck.dart';

part 'deckList.g.dart';

@riverpod
class DeckListNotifier extends _$DeckListNotifier {
  @override
  List<Deck> build() {
    fetchDecks();
    return state;
  }

  void fetchDecks() {
    state = DeckHooks().getDeckList();
  }

  Deck createDeck(String deckName) {
    final deck = DeckHooks().createDeck(deckName);
    fetchDecks();
    return deck;
  }
}
