import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:turn1checker/types/EffectCheckButtonState/effectCheckButtonState.dart';
import 'package:turn1checker/types/counterState/counterState.dart';

part 'cardButtonState.freezed.dart';

@freezed
abstract class CardButtonState with _$CardButtonState {
  const factory CardButtonState({
    required String name,
    required String image,
    required Color color,
    required List<ButtonWithOrderState> buttonWithOrderState,
  }) = _CardButtonState;
}

sealed class ButtonWithOrderState {
  final int order;
  ButtonWithOrderState(this.order);
}

class EffectCheckButtonWithOrderState extends ButtonWithOrderState {
  final EffectCheckButtonState effectButton;
  EffectCheckButtonWithOrderState(int order, this.effectButton) : super(order);

  get effectCheckButtonState => null;

  EffectCheckButtonWithOrderState copyWith({
    int? order,
    EffectCheckButtonState? effectButton,
  }) {
    return EffectCheckButtonWithOrderState(
      order ?? this.order,
      effectButton ?? this.effectButton,
    );
  }
}

class CounterButtonWithOrderState extends ButtonWithOrderState {
  final CounterState counterButton;
  CounterButtonWithOrderState(int order, this.counterButton) : super(order);

  get counterState => null;

  CounterButtonWithOrderState copyWith({
    int? order,
    CounterState? counterButton,
  }) {
    return CounterButtonWithOrderState(
      order ?? this.order,
      counterButton ?? this.counterButton,
    );
  }
}
