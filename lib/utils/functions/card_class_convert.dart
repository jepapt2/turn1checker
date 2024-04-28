import 'dart:io';

import 'package:realm/realm.dart';
import 'package:turn1checker/model/cardButtons/card_buttons.dart';
import 'package:turn1checker/model/counter/counter.dart';
import 'package:turn1checker/model/effectCheckButton/effect_check_button.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/types/EffectCheckButtonState/effectCheckButtonState.dart';
import 'package:turn1checker/types/card_type.dart';
import 'package:turn1checker/types/counterState/counterState.dart';
import 'package:turn1checker/utils/functions/file_controller.dart';

CardButtons cardButtonsConvertStateToDb(
    {required CardButtonState state, required ObjectId id, String? imageName}) {
  final effectCheckButtons = state.buttonWithOrderState
      .map((e) {
        if (e is EffectCheckButtonWithOrderState) {
          final button = e.effectButton;
          return EffectCheckButton(ObjectId(), button.description, button.limit,
              button.limitPeriod.name, e.order);
        }
      })
      .whereType<EffectCheckButton>()
      .toList();
  final counters = state.buttonWithOrderState
      .map((e) {
        if (e is CounterButtonWithOrderState) {
          final counter = e.counterButton;
          return Counter(ObjectId(), counter.initialValue, e.order,
              buttonsValue: counter.buttons);
        }
      })
      .whereType<Counter>()
      .toList();
  return CardButtons(
    id,
    state.type.name,
    state.name,
    image: imageName,
    effectCheckButtons: effectCheckButtons,
    counters: counters,
    DateTime.now(),
    DateTime.now(),
  );
}

CardButtonState cardButtonsConvertDbToState(CardButtons cardButtons) {
  final effectCheckButtons = cardButtons.effectCheckButtons.map((e) {
    return EffectCheckButtonWithOrderState(
        e.order,
        EffectCheckButtonState(
          description: e.description,
          count: 0,
          limit: e.limit,
          limitPeriod: EffectLimitPeriod.values
              .firstWhere((element) => element.name == e.period),
        ));
  }).toList();
  final counters = cardButtons.counters.map((e) {
    return CounterButtonWithOrderState(
        e.order,
        CounterState(
          value: 0,
          initialValue: e.initialValue,
          buttons: e.buttonsValue,
        ));
  }).toList();

  List<ButtonWithOrderState> buttonWithOrderState = [
    ...effectCheckButtons,
    ...counters,
  ];

  buttonWithOrderState.sort((a, b) => a.order.compareTo(b.order));

  return CardButtonState(
    name: cardButtons.name,
    image: cardButtons.image,
    type: CardType.values
        .firstWhere((element) => element.name == cardButtons.type),
    buttonWithOrderState: buttonWithOrderState,
  );
}
