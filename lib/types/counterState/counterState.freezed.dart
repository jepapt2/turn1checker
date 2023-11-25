// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counterState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CounterState {
  int get value => throw _privateConstructorUsedError;
  int get initialValue => throw _privateConstructorUsedError;
  List<CounterButtonState> get buttons => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CounterStateCopyWith<CounterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterStateCopyWith<$Res> {
  factory $CounterStateCopyWith(
          CounterState value, $Res Function(CounterState) then) =
      _$CounterStateCopyWithImpl<$Res, CounterState>;
  @useResult
  $Res call({int value, int initialValue, List<CounterButtonState> buttons});
}

/// @nodoc
class _$CounterStateCopyWithImpl<$Res, $Val extends CounterState>
    implements $CounterStateCopyWith<$Res> {
  _$CounterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? initialValue = null,
    Object? buttons = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      initialValue: null == initialValue
          ? _value.initialValue
          : initialValue // ignore: cast_nullable_to_non_nullable
              as int,
      buttons: null == buttons
          ? _value.buttons
          : buttons // ignore: cast_nullable_to_non_nullable
              as List<CounterButtonState>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CounterStateImplCopyWith<$Res>
    implements $CounterStateCopyWith<$Res> {
  factory _$$CounterStateImplCopyWith(
          _$CounterStateImpl value, $Res Function(_$CounterStateImpl) then) =
      __$$CounterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value, int initialValue, List<CounterButtonState> buttons});
}

/// @nodoc
class __$$CounterStateImplCopyWithImpl<$Res>
    extends _$CounterStateCopyWithImpl<$Res, _$CounterStateImpl>
    implements _$$CounterStateImplCopyWith<$Res> {
  __$$CounterStateImplCopyWithImpl(
      _$CounterStateImpl _value, $Res Function(_$CounterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? initialValue = null,
    Object? buttons = null,
  }) {
    return _then(_$CounterStateImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      initialValue: null == initialValue
          ? _value.initialValue
          : initialValue // ignore: cast_nullable_to_non_nullable
              as int,
      buttons: null == buttons
          ? _value._buttons
          : buttons // ignore: cast_nullable_to_non_nullable
              as List<CounterButtonState>,
    ));
  }
}

/// @nodoc

class _$CounterStateImpl implements _CounterState {
  const _$CounterStateImpl(
      {required this.value,
      required this.initialValue,
      required final List<CounterButtonState> buttons})
      : _buttons = buttons;

  @override
  final int value;
  @override
  final int initialValue;
  final List<CounterButtonState> _buttons;
  @override
  List<CounterButtonState> get buttons {
    if (_buttons is EqualUnmodifiableListView) return _buttons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_buttons);
  }

  @override
  String toString() {
    return 'CounterState(value: $value, initialValue: $initialValue, buttons: $buttons)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterStateImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.initialValue, initialValue) ||
                other.initialValue == initialValue) &&
            const DeepCollectionEquality().equals(other._buttons, _buttons));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, initialValue,
      const DeepCollectionEquality().hash(_buttons));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CounterStateImplCopyWith<_$CounterStateImpl> get copyWith =>
      __$$CounterStateImplCopyWithImpl<_$CounterStateImpl>(this, _$identity);
}

abstract class _CounterState implements CounterState {
  const factory _CounterState(
      {required final int value,
      required final int initialValue,
      required final List<CounterButtonState> buttons}) = _$CounterStateImpl;

  @override
  int get value;
  @override
  int get initialValue;
  @override
  List<CounterButtonState> get buttons;
  @override
  @JsonKey(ignore: true)
  _$$CounterStateImplCopyWith<_$CounterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CounterButtonState {
  int get value => throw _privateConstructorUsedError;
  bool get isIncrement => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CounterButtonStateCopyWith<CounterButtonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterButtonStateCopyWith<$Res> {
  factory $CounterButtonStateCopyWith(
          CounterButtonState value, $Res Function(CounterButtonState) then) =
      _$CounterButtonStateCopyWithImpl<$Res, CounterButtonState>;
  @useResult
  $Res call({int value, bool isIncrement});
}

/// @nodoc
class _$CounterButtonStateCopyWithImpl<$Res, $Val extends CounterButtonState>
    implements $CounterButtonStateCopyWith<$Res> {
  _$CounterButtonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? isIncrement = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      isIncrement: null == isIncrement
          ? _value.isIncrement
          : isIncrement // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CounterButtonStateImplCopyWith<$Res>
    implements $CounterButtonStateCopyWith<$Res> {
  factory _$$CounterButtonStateImplCopyWith(_$CounterButtonStateImpl value,
          $Res Function(_$CounterButtonStateImpl) then) =
      __$$CounterButtonStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value, bool isIncrement});
}

/// @nodoc
class __$$CounterButtonStateImplCopyWithImpl<$Res>
    extends _$CounterButtonStateCopyWithImpl<$Res, _$CounterButtonStateImpl>
    implements _$$CounterButtonStateImplCopyWith<$Res> {
  __$$CounterButtonStateImplCopyWithImpl(_$CounterButtonStateImpl _value,
      $Res Function(_$CounterButtonStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? isIncrement = null,
  }) {
    return _then(_$CounterButtonStateImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      isIncrement: null == isIncrement
          ? _value.isIncrement
          : isIncrement // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CounterButtonStateImpl implements _CounterButtonState {
  const _$CounterButtonStateImpl(
      {required this.value, required this.isIncrement});

  @override
  final int value;
  @override
  final bool isIncrement;

  @override
  String toString() {
    return 'CounterButtonState(value: $value, isIncrement: $isIncrement)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterButtonStateImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.isIncrement, isIncrement) ||
                other.isIncrement == isIncrement));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, isIncrement);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CounterButtonStateImplCopyWith<_$CounterButtonStateImpl> get copyWith =>
      __$$CounterButtonStateImplCopyWithImpl<_$CounterButtonStateImpl>(
          this, _$identity);
}

abstract class _CounterButtonState implements CounterButtonState {
  const factory _CounterButtonState(
      {required final int value,
      required final bool isIncrement}) = _$CounterButtonStateImpl;

  @override
  int get value;
  @override
  bool get isIncrement;
  @override
  @JsonKey(ignore: true)
  _$$CounterButtonStateImplCopyWith<_$CounterButtonStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
