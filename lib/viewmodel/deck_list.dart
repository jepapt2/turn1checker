import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:turn1checker/model/db/db.dart';

import '../hooks/decks.dart';

class DeckList extends AsyncNotifier<List<Deck>> {
  @override
  Future<List<Deck>> build() {
    return _fetchDecks();
  }

  Future<List<Deck>> _fetchDecks() {
    state = const AsyncValue.loading();

    return Decks().watchDecks();
  }

  Future<void> createDeck(String deckName) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      Decks().createDeck(deckName);

      return _fetchDecks();
    });
  }
}

final deckListProvider = AsyncNotifierProvider<DeckList, List<Deck>>(() {
  return DeckList();
});
