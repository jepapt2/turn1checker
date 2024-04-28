import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart';
import 'package:realm/realm.dart';
import 'package:turn1checker/types/EffectCheckButtonState/effectCheckButtonState.dart';
import 'package:turn1checker/types/card_type.dart';
import 'package:turn1checker/types/counterState/counterState.dart';

class CardButtonState {
  final ObjectId id;
  final String name;
  final String? image;
  final Uint8List? editImage;
  final CardType type;
  final List<ButtonWithOrderState> buttonWithOrderState;
  const CardButtonState(
      {required ObjectId id,
      required String name,
      String? image,
      this.editImage,
      required CardType type,
      required List<ButtonWithOrderState> buttonWithOrderState})
      : id = id,
        name = name,
        image = image,
        type = type,
        buttonWithOrderState = buttonWithOrderState;

  CardButtonState copyWith({
    ObjectId? id,
    String? name,
    String? image,
    Uint8List? editImage,
    CardType? type,
    List<ButtonWithOrderState>? buttonWithOrderState,
  }) {
    return CardButtonState(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      editImage: editImage ?? this.editImage,
      type: type ?? this.type,
      buttonWithOrderState: buttonWithOrderState ?? this.buttonWithOrderState,
    );
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is CardButtonState) {
      return runtimeType == other.runtimeType && id == other.id;
    } else {
      return false;
    }
  }
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
