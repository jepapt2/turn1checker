import 'dart:math';

import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:turn1checker/hooks/deck.dart';
import 'package:turn1checker/model/deck/deck.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/types/EffectCheckButtonState/effectCheckButtonState.dart';
import 'package:turn1checker/types/deck_state/deck_state.dart';
import 'package:turn1checker/utils/functions/card_class_convert.dart';
import 'package:turn1checker/utils/functions/list_find_function.dart';
import 'package:turn1checker/viewmodel/card_buttons/card_buttons.dart';
import 'package:turn1checker/viewmodel/deckList/deckList.dart';

part 'deck.g.dart';

@riverpod
class DeckNotifier extends _$DeckNotifier {
  bool isDeleteDeck = false;
  late DeckListNotifier deckListNotifier =
      ref.watch(deckListNotifierProvider.notifier);
  late List<CardButtonState> initialCardButtonStateList;
  late List<CardButtonsNotifier> cardButtonsNotifierList;
  late Deck deck;
  @override
  DeckState build(id) {
    stateInitialization(id);

    return state;
  }

  void stateInitialization(ObjectId id) {
    final deckData = DeckHooks().getDeck(id);
    if (deckData != null) {
      deck = deckData;
    } else {
      throw Exception('Deck not found');
    }

    final initialCardState =
        deck.cards.map((card) => cardButtonsConvertDbToState(card)).toList();

    initialCardButtonStateList = initialCardState;

    cardButtonsNotifierList = initialCardState
        .map((c) => ref
            .watch(cardButtonsNotifierProvider(initialCardState: c).notifier))
        .toList();

    state = DeckState(
      name: deck.name,
      turn: 1,
      cardButtonStateListRecord: [],
    );
  }

  bool isLatestTurn() {
    return state.cardButtonStateListRecord.length <= state.turn;
  }

  void changeTurn(int changeTurn) {
    final currentTurnIndex = state.turn - 1;
    final changeTurnIndex = changeTurn - 1;
    final currentTurnList = initialCardButtonStateList
        .map((e) => ref.read(cardButtonsNotifierProvider(initialCardState: e)))
        .toList();
    List<List<CardButtonState>> cardButtonStateListRecord =
        state.cardButtonStateListRecord;

    //現在ターンが最新の場合
    if (cardButtonStateListRecord.length <= currentTurnIndex) {
      cardButtonStateListRecord = [
        ...cardButtonStateListRecord,
        currentTurnList
      ];
    } else {
      cardButtonStateListRecord[currentTurnIndex] = currentTurnList;
    }

    if (cardButtonStateListRecord.length < changeTurn) {
      for (var element in initialCardButtonStateList) {
        ref
            .watch(
                cardButtonsNotifierProvider(initialCardState: element).notifier)
            .update((prev) => prev.copyWith(
                    buttonWithOrderState: prev.buttonWithOrderState.map((e) {
                  if (e is EffectCheckButtonWithOrderState) {
                    return e.copyWith(
                        effectButton: e.effectButton.copyWith(
                            count: e.effectButton.limitPeriod ==
                                    EffectLimitPeriod.turn
                                ? 0
                                : e.effectButton.count));
                  }
                  return e;
                }).toList()));
      }
    } else {
      initialCardButtonStateList.asMap().forEach((index, element) {
        ref
            .watch(
                cardButtonsNotifierProvider(initialCardState: element).notifier)
            .update((prev) =>
                state.cardButtonStateListRecord[changeTurnIndex][index]);
      });
    }

    state = state.copyWith(
        turn: changeTurn, cardButtonStateListRecord: cardButtonStateListRecord);
  }

  void onCloseDeck() {
    DeckHooks().saveUpdatedDeck(deck);
    deckListNotifier.fetchDecks();
  }
}
