import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/types/EffectCheckButtonState/effectCheckButtonState.dart';
import 'package:turn1checker/types/card_type.dart';
import 'package:turn1checker/types/counterState/counterState.dart';

part 'card_buttons.g.dart';

@riverpod
class CardButtonsNotifier extends _$CardButtonsNotifier {
  @override
  CardButtonState build({CardButtonState? initialCardState}) {
    state = initialCardState ??
        CardButtonState(
          id: ObjectId(),
          name: '',
          type: CardType.monster,
          buttonWithOrderState: [],
        );
    return state;
  }

  void update(CardButtonState Function(CardButtonState) updatedCard) {
    state = updatedCard(state);
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

  void pressEffectCheckButton(int order) {
    updateEffectCheckButton(order, (prev) {
      return prev.copyWith(count: min(prev.count + 1, prev.limit));
    });
  }

  void resetEffectCheckButton(int order) {
    updateEffectCheckButton(order, (prev) {
      return prev.copyWith(count: 0);
    });
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

  void pressCounterButton(int order, int value) {
    updateCounter(order, (prev) {
      return prev.copyWith(value: max(prev.value + value, 0));
    });
  }

  void resetCounterButton(int order) {
    updateCounter(order, (prev) {
      return prev.copyWith(value: prev.initialValue);
    });
  }
}
