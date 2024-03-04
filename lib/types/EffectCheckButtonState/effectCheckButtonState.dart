import 'package:freezed_annotation/freezed_annotation.dart';

part 'effectCheckButtonState.freezed.dart';

@freezed
abstract class EffectCheckButtonState with _$EffectCheckButtonState {
  const factory EffectCheckButtonState(
          {required String description,
          required int count,
          required int limit,
          @Default(EffectLimitPeriod.turn) EffectLimitPeriod limitPeriod}) =
      _EffectCheckButtonState;
}

enum EffectLimitPeriod {
  turn,
  duel,
}
