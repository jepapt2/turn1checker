// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deck_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeckState {
  int get turn => throw _privateConstructorUsedError;
  set turn(int value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  List<List<CardButtonState>> get cardButtonStateListRecord =>
      throw _privateConstructorUsedError;
  set cardButtonStateListRecord(List<List<CardButtonState>> value) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeckStateCopyWith<DeckState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckStateCopyWith<$Res> {
  factory $DeckStateCopyWith(DeckState value, $Res Function(DeckState) then) =
      _$DeckStateCopyWithImpl<$Res, DeckState>;
  @useResult
  $Res call(
      {int turn,
      String name,
      List<List<CardButtonState>> cardButtonStateListRecord});
}

/// @nodoc
class _$DeckStateCopyWithImpl<$Res, $Val extends DeckState>
    implements $DeckStateCopyWith<$Res> {
  _$DeckStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? turn = null,
    Object? name = null,
    Object? cardButtonStateListRecord = null,
  }) {
    return _then(_value.copyWith(
      turn: null == turn
          ? _value.turn
          : turn // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cardButtonStateListRecord: null == cardButtonStateListRecord
          ? _value.cardButtonStateListRecord
          : cardButtonStateListRecord // ignore: cast_nullable_to_non_nullable
              as List<List<CardButtonState>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeckStateImplCopyWith<$Res>
    implements $DeckStateCopyWith<$Res> {
  factory _$$DeckStateImplCopyWith(
          _$DeckStateImpl value, $Res Function(_$DeckStateImpl) then) =
      __$$DeckStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int turn,
      String name,
      List<List<CardButtonState>> cardButtonStateListRecord});
}

/// @nodoc
class __$$DeckStateImplCopyWithImpl<$Res>
    extends _$DeckStateCopyWithImpl<$Res, _$DeckStateImpl>
    implements _$$DeckStateImplCopyWith<$Res> {
  __$$DeckStateImplCopyWithImpl(
      _$DeckStateImpl _value, $Res Function(_$DeckStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? turn = null,
    Object? name = null,
    Object? cardButtonStateListRecord = null,
  }) {
    return _then(_$DeckStateImpl(
      turn: null == turn
          ? _value.turn
          : turn // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cardButtonStateListRecord: null == cardButtonStateListRecord
          ? _value.cardButtonStateListRecord
          : cardButtonStateListRecord // ignore: cast_nullable_to_non_nullable
              as List<List<CardButtonState>>,
    ));
  }
}

/// @nodoc

class _$DeckStateImpl implements _DeckState {
  _$DeckStateImpl(
      {required this.turn,
      required this.name,
      required this.cardButtonStateListRecord});

  @override
  int turn;
  @override
  String name;
  @override
  List<List<CardButtonState>> cardButtonStateListRecord;

  @override
  String toString() {
    return 'DeckState(turn: $turn, name: $name, cardButtonStateListRecord: $cardButtonStateListRecord)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeckStateImplCopyWith<_$DeckStateImpl> get copyWith =>
      __$$DeckStateImplCopyWithImpl<_$DeckStateImpl>(this, _$identity);
}

abstract class _DeckState implements DeckState {
  factory _DeckState(
          {required int turn,
          required String name,
          required List<List<CardButtonState>> cardButtonStateListRecord}) =
      _$DeckStateImpl;

  @override
  int get turn;
  set turn(int value);
  @override
  String get name;
  set name(String value);
  @override
  List<List<CardButtonState>> get cardButtonStateListRecord;
  set cardButtonStateListRecord(List<List<CardButtonState>> value);
  @override
  @JsonKey(ignore: true)
  _$$DeckStateImplCopyWith<_$DeckStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
