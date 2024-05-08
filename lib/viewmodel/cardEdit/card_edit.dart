import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:riverpod/src/framework.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:turn1checker/components/ui/primary_snackbar.dart';
import 'package:turn1checker/hooks/card.dart';
import 'package:turn1checker/i18n/i18n.g.dart';
import 'package:turn1checker/model/cardButtons/card_buttons.dart';
import 'package:turn1checker/model/deck/deck.dart';
import 'package:turn1checker/model/realm.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/types/EditCardState/editCardState.dart';
import 'package:turn1checker/types/EffectCheckButtonState/effectCheckButtonState.dart';
import 'package:turn1checker/types/card_type.dart';
import 'package:turn1checker/types/counterState/counterState.dart';
import 'package:turn1checker/utils/functions/card_class_convert.dart';
import 'package:turn1checker/utils/functions/file_controller.dart';
import 'package:turn1checker/utils/functions/list_find_function.dart';
import 'package:turn1checker/viewmodel/card_buttons/card_buttons.dart';
import 'package:turn1checker/viewmodel/deck_edit/deck_edit.dart';

part 'card_edit.g.dart';

enum CounterButtonIncrementType { add, remove }

@riverpod
class CardEditNotifier extends _$CardEditNotifier {
  late CardButtonsNotifier cardButtonsNotifier;
  late CardButtonState cardState;
  late Deck deckState;
  late DeckEditNotifier deckEditNotifier;
  CardButtons? existCard;

  bool isDeleteCard = false;

  @override
  CardButtonState build({required ObjectId deckId, ObjectId? cardId}) {
    CardButtonState? initialCard;
    if (cardId != null) {
      existCard = CardHooks().getCard(cardId);
      if (existCard != null) {
        initialCard = cardButtonsConvertDbToState(existCard!);
      }
    }
    cardState =
        ref.watch(cardButtonsNotifierProvider(initialCardState: initialCard));
    cardButtonsNotifier = ref.read(
        cardButtonsNotifierProvider(initialCardState: initialCard).notifier);
    deckState = ref.watch(deckEditNotifierProvider(deckId));
    deckEditNotifier = ref.read(deckEditNotifierProvider(deckId).notifier);
    ref.onDispose(() {
      if (isDeleteCard && existCard is CardButtons) {
        CardHooks().deleteCard(existCard!);
        deckEditNotifier.fetchDecks(deckId);
      }
    });
    return cardState;
  }

  void addEffectButton() {
    cardButtonsNotifier.update((prev) => prev.copyWith(buttonWithOrderState: [
          ...state.buttonWithOrderState,
          EffectCheckButtonWithOrderState(
              state.buttonWithOrderState.length + 1,
              EffectCheckButtonState(
                  description: switch (state.buttonWithOrderState.length + 1) {
                    1 => '①',
                    2 => '②',
                    3 => '③',
                    _ => '',
                  },
                  count: 0,
                  limit: 1)),
        ]));
  }

  void addCounter() {
    cardButtonsNotifier.update((prev) => prev.copyWith(buttonWithOrderState: [
          ...state.buttonWithOrderState,
          CounterButtonWithOrderState(state.buttonWithOrderState.length + 1,
              const CounterState(value: 0, initialValue: 0, buttons: [1, -1])),
        ]));
  }

  void updateEffectCheckButton(int order,
      EffectCheckButtonState Function(EffectCheckButtonState) update) {
    cardButtonsNotifier.update((prev) => prev.copyWith(
            buttonWithOrderState: state.buttonWithOrderState.map((e) {
          if (e is EffectCheckButtonWithOrderState && e.order == order) {
            final button = e;
            return button.copyWith(effectButton: update(e.effectButton));
          } else {
            return e;
          }
        }).toList()));
  }

  void updateCounterButton({
    required int order,
    required int buttonIndex,
    int? value,
    CounterButtonIncrementType? incrimentType,
  }) {
    cardButtonsNotifier.updateCounter(order, (prev) {
      List<int> buttons = prev.buttons;
      if (value != null) {
        buttons =
            listFindUpdate(list: buttons, index: buttonIndex, value: value);
      }

      final isIncriment = incrimentType ??
          (prev.buttons[buttonIndex] > 0
              ? CounterButtonIncrementType.add
              : CounterButtonIncrementType.remove);

      final buttonValue = buttons[buttonIndex] == 0 ? 1 : buttons[buttonIndex];

      final updateValue = isIncriment == CounterButtonIncrementType.add
          ? buttonValue.abs()
          : buttonValue.abs() * -1;
      final updateButtons =
          listFindUpdate(list: buttons, index: buttonIndex, value: updateValue);

      return prev.copyWith(buttons: updateButtons);
    });
  }

  void removeButton(int order) {
    cardButtonsNotifier.update((prev) => prev.copyWith(
            buttonWithOrderState: state.buttonWithOrderState
                .where((element) => element.order != order)
                .toList()
                .asMap()
                .entries
                .map((e) {
          final order = e.key + 1;
          final value = e.value;
          if (value is EffectCheckButtonWithOrderState) {
            final button = value;
            return button.copyWith(order: order);
          }
          if (value is CounterButtonWithOrderState) {
            final counter = value;
            return counter.copyWith(order: order);
          }
          return value;
        }).toList()));
  }

  void deleteAndResetImage({bool delete = false}) {
    cardButtonsNotifier.update((prev) => CardButtonState(
        id: prev.id,
        editImage: null,
        image: delete ? null : prev.image,
        name: prev.name,
        type: prev.type,
        buttonWithOrderState: prev.buttonWithOrderState));
  }

  Future<void> saveCard(BuildContext context) async {
    if (state.buttonWithOrderState.isEmpty) {
      showPrimarySnackbar(
          context, t.text.buttonsLengthVaridateError, SnackBarType.error);
      return;
    }
    final editImage = state.editImage;
    final id = ObjectId();
    String? updateImage;
    if (editImage != null) {
      updateImage = await FileController.saveLocalImage(editImage, id)
          .then((_) => '$id.png');
    }
    final card = cardButtonsConvertStateToDb(
        state: state, prevData: existCard, imageName: updateImage);
    realm.write(() {
      if (existCard == null) {
        deckState.cards.add(card);
        return;
      }
      final CardButtons updateCard = existCard!;
      realm.deleteMany(updateCard.effectCheckButtons);
      realm.deleteMany(updateCard.counters);
      realm.add(card, update: true);
    });
    deckEditNotifier.fetchDecks(deckState.id);
  }
}
