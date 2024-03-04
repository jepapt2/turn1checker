import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/types/EditCardState/editCardState.dart';
import 'package:turn1checker/types/EffectCheckButtonState/effectCheckButtonState.dart';
import 'package:turn1checker/types/counterState/counterState.dart';

part 'card_edit.g.dart';

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
          const CounterState(value: 0, initialValue: 0, buttons: [])),
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

  void removeButton(int order) {
    state = state.copyWith(
        buttonWithOrderState: state.buttonWithOrderState
            .where((element) => element.order != order)
            .toList());
  }
}
