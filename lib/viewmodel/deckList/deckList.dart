import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:turn1checker/components/ui/primary_snackbar.dart';
import 'package:turn1checker/hooks/deck.dart';
import 'package:turn1checker/i18n/i18n.g.dart';
import 'package:turn1checker/model/deck/deck.dart';
import 'package:turn1checker/types/local_data_options/local_data_options.dart';
import 'package:turn1checker/viewmodel/local_data/local_data.dart';

part 'deckList.g.dart';

@riverpod
class DeckListNotifier extends _$DeckListNotifier {
  late AsyncValue<LocalDataOptions> localData;
  @override
  List<Deck> build() {
    fetchDecks();
    localData = ref.watch(localDataNotifierProvider);
    return state;
  }

  void fetchDecks() {
    state = DeckHooks().getDeckList();
  }

  Deck? createDeck(String deckName, BuildContext context) {
    if (state.length >= (localData.value?.deckSlot ?? 2)) {
      showPrimarySnackbar(context, t.text.limitOfDeckSlot, SnackBarType.error);
    }
    final deck = DeckHooks().createDeck(deckName);
    fetchDecks();
    return deck;
  }
}

class SnackbarType {}
