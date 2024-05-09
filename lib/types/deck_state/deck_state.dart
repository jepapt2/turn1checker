import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:realm/realm.dart';
import 'package:turn1checker/types/CardButtonState/cardButtonState.dart';
import 'package:turn1checker/viewmodel/card_buttons/card_buttons.dart';

part 'deck_state.freezed.dart';

@unfreezed
abstract class DeckState with _$DeckState {
  factory DeckState({
    required int turn,
    required String name,
    required List<List<CardButtonState>> cardButtonStateListRecord,
  }) = _DeckState;
}
