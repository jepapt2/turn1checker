import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/types/EditCardState/editCardState.dart';
import 'package:turn1checker/types/EffectCheckButtonState/effectCheckButtonState.dart';
import 'package:turn1checker/types/counterState/counterState.dart';
import 'package:turn1checker/utils/functions/list_find_function.dart';

part 'card_edit.g.dart';

enum CounterButtonIncrementType { add, remove }

@riverpod
class CardEditNotifier extends _$CardEditNotifier {
  @override
  CardButtonState build() {
    initialCardState();
    return state;
  }

  void initialCardState() {
    state = const CardButtonState(
        name: '', color: Colors.white, buttonWithOrderState: []);
  }

  void updateState(CardButtonState Function(CardButtonState) updatedCard) {
    state = updatedCard(state);
  }

  void addEffectButton() {
    state = state.copyWith(buttonWithOrderState: [
      ...state.buttonWithOrderState,
      EffectCheckButtonWithOrderState(state.buttonWithOrderState.length + 1,
          const EffectCheckButtonState(description: '', count: 0, limit: 1)),
    ]);
  }

  void addCounter() {
    state = state.copyWith(buttonWithOrderState: [
      ...state.buttonWithOrderState,
      CounterButtonWithOrderState(state.buttonWithOrderState.length + 1,
          const CounterState(value: 0, initialValue: 0, buttons: [1, -1])),
    ]);
  }

  void updateEffectCheckButton(int order,
      EffectCheckButtonState Function(EffectCheckButtonState) update) {
    state = state.copyWith(
        buttonWithOrderState: state.buttonWithOrderState.map((e) {
      if (e is EffectCheckButtonWithOrderState && e.order == order) {
        final button = e;
        return button.copyWith(effectButton: update(e.effectButton));
      } else {
        return e;
      }
    }).toList());
  }

  void updateCounter(int order, CounterState Function(CounterState) update) {
    state = state.copyWith(
        buttonWithOrderState: state.buttonWithOrderState.map((e) {
      if (e is CounterButtonWithOrderState && e.order == order) {
        final button = e;
        return button.copyWith(counterButton: update(e.counterButton));
      } else {
        return e;
      }
    }).toList());
  }

  void updateCounterButton({
    required int order,
    required int buttonIndex,
    int? value,
    CounterButtonIncrementType? incrimentType,
  }) {
    updateCounter(order, (prev) {
      List<int> buttons = prev.buttons;
      if (value != null) {
        buttons =
            listFindUpdate(list: buttons, index: buttonIndex, value: value);
      }

      final isIncriment = incrimentType ??
          (prev.buttons[buttonIndex] > 0
              ? CounterButtonIncrementType.add
              : CounterButtonIncrementType.remove);

      final updateValue = isIncriment == CounterButtonIncrementType.add
          ? buttons[buttonIndex].abs()
          : buttons[buttonIndex].abs() * -1;
      buttons =
          listFindUpdate(list: buttons, index: buttonIndex, value: updateValue);

      return prev.copyWith(buttons: buttons);
    });
  }

  void pressCounterButton(int order, int value) {
    updateCounter(order, (prev) {
      return prev.copyWith(value: max(prev.value + value, 0));
    });
  }

  void removeButton(int order) {
    state = state.copyWith(
        buttonWithOrderState: state.buttonWithOrderState
            .where((element) => element.order != order)
            .toList());
  }
}
