import 'package:freezed_annotation/freezed_annotation.dart';

part 'counterState.freezed.dart';

@freezed
abstract class CounterState with _$CounterState {
  const factory CounterState({
    required int value,
    required int initialValue,
    required List<int> buttons,
  }) = _CounterState;
}
