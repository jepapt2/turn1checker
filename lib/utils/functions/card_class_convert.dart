import 'dart:io';

import 'package:realm/realm.dart';
import 'package:turn1checker/model/cardButtons/card_buttons.dart';
import 'package:turn1checker/model/counter/counter.dart';
import 'package:turn1checker/model/effectCheckButton/effect_check_button.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/types/EffectCheckButtonState/effectCheckButtonState.dart';
import 'package:turn1checker/types/card_type.dart';
import 'package:turn1checker/types/counterState/counterState.dart';
import 'package:turn1checker/utils/extension/list.dart';
import 'package:turn1checker/utils/functions/file_controller.dart';

CardButtons cardButtonsConvertStateToDb(
    {required CardButtonState state,
    CardButtons? prevData,
    String? imageName}) {
  final buttonStateOrders = state.buttonWithOrderState.mapWithIndex((e, index) {
    if (index + 1 != e.order) {
      throw Exception('ボタンの順序番号が不正です。order: ${e.order}, index: $index');
    }
    return e.order;
  });
  if (buttonStateOrders.length > 3 || buttonStateOrders.isEmpty) {
    throw Exception('ボタンの数が不正です。buttonStateOrders: $buttonStateOrders');
  }
  if (buttonStateOrders.any((order) => order < 1 || order > 3)) {
    throw Exception('ボタンの順序番号が不正です。buttonStateOrders: $buttonStateOrders');
  }

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
          if (counter.buttons.isEmpty || counter.buttons.length > 2) {
            throw Exception(
                'カウンターボタンの数が不正です。buttons: ${counter.buttons.length}');
          }
          return Counter(ObjectId(), counter.initialValue, e.order,
              buttonsValue: counter.buttons);
        }
      })
      .whereType<Counter>()
      .toList();
  final buttonsLength = effectCheckButtons.length + counters.length;
  if (buttonsLength == 0 || buttonsLength > 3) {
    throw Exception(
        'カードボタンの数が不正です。effectCheckButtons: ${effectCheckButtons.length}, counters: ${counters.length}');
  }

  return CardButtons(
    state.id,
    state.type.name,
    state.name,
    prevData?.createdAt ?? DateTime.now().toUtc(),
    DateTime.now().toUtc(),
    image: imageName ?? state.image,
    effectCheckButtons: effectCheckButtons,
    counters: counters,
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
          limitPeriod: EffectLimitPeriod.values.firstWhere(
            (element) => element.name == e.period,
            orElse: () => throw Exception('無効な期間: ${e.period}'),
          ),
        ));
  }).toList();
  final counters = cardButtons.counters.map((e) {
    return CounterButtonWithOrderState(
        e.order,
        CounterState(
          value: e.initialValue,
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
    id: cardButtons.id,
    name: cardButtons.name,
    image: cardButtons.image,
    type: CardType.values.firstWhere(
      (element) => element.name == cardButtons.type,
      orElse: () => throw Exception('無効なカードタイプ: ${cardButtons.type}'),
    ),
    buttonWithOrderState: buttonWithOrderState,
  );
}
