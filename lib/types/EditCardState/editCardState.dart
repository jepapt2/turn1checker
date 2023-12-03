import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';

part 'editCardState.freezed.dart';

@freezed
abstract class EditCardState with _$EditCardState {
  const factory EditCardState({
    required CardButtonState cardButtonState,
    required List<Widget> editButtonInputList,
  }) = _EditCardState;
}
