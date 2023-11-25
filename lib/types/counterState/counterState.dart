import 'package:freezed_annotation/freezed_annotation.dart';

part 'counterState.freezed.dart';

@freezed
abstract class CounterState with _$CounterState {
  const factory CounterState({
    required int value,
    required int initialValue,
    required List<CounterButtonState> buttons,
  }) = _CounterState;
}

@freezed
abstract class CounterButtonState with _$CounterButtonState {
  const factory CounterButtonState({
    required int value,
    required bool isIncrement,
  }) = _CounterButtonState;
}
