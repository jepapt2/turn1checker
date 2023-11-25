import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cardButtonState.freezed.dart';

@freezed
abstract class CardButtonState with _$CardButtonState {
  const factory CardButtonState({
    required String name,
    required Color color,
    required List<ButtonWithOrderState> buttonWithOrderState,
  }) = _CardButtonState;
}

sealed class ButtonWithOrderState {
  final int order;
  ButtonWithOrderState(this.order);
}

class EffectCheckButtonState extends ButtonWithOrderState {
  final EffectCheckButtonState effectButton;
  EffectCheckButtonState(int order, this.effectButton) : super(order);
}

class CounterButtonState extends ButtonWithOrderState {
  final CounterButtonState counterButton;
  CounterButtonState(int order, this.counterButton) : super(order);
}
