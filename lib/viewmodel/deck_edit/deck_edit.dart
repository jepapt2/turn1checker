import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:turn1checker/hooks/deck.dart';
import 'package:turn1checker/model/deck/deck.dart';
import 'package:turn1checker/viewmodel/deckList/deckList.dart';

part 'deck_edit.g.dart';

@riverpod
class DeckEditNotifier extends _$DeckEditNotifier {
  bool isDeleteDeck = false;
  late DeckListNotifier deckListNotifier =
      ref.watch(deckListNotifierProvider.notifier);
  @override
  Deck build(id) {
    fetchDecks(id);
    ref.onDispose(() {
      if (isDeleteDeck) {
        DeckHooks().deleteDeck(state);
        deckListNotifier.fetchDecks();
      }
    });
    return state;
  }

  void fetchDecks(ObjectId id) {
    final deck = DeckHooks().getDeck(id);
    if (deck == null) {
      throw Exception('Deck not found');
    }
    state = deck;
  }

  void cardTypeSort() {
    DeckHooks().sortCardType(state);
    fetchDecks(id);
  }

  void manualSort(int oldIndex, int newIndex) {
    DeckHooks().manualSort(deck: state, oldIndex: oldIndex, newIndex: newIndex);
    fetchDecks(id);
  }

  void updateDeckName(String name) {
    DeckHooks().saveDeck(state, () {
      state.name = name;
    });
    fetchDecks(id);
  }

  void deleteDeck() {
    isDeleteDeck = true;
  }
}
