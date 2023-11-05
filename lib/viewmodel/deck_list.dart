import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:turn1checker/model/deck/deck.dart';

import '../hooks/deck.dart';
part 'deck_list.g.dart';

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

  void createDeck(String deckName) {
    DeckHooks().createDeck(deckName);
    fetchDecks();
  }
}
