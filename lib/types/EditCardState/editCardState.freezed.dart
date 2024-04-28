// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'editCardState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditCardState {
  CardButtonState get cardButtonState => throw _privateConstructorUsedError;
  List<Widget> get editButtonInputList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditCardStateCopyWith<EditCardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditCardStateCopyWith<$Res> {
  factory $EditCardStateCopyWith(
          EditCardState value, $Res Function(EditCardState) then) =
      _$EditCardStateCopyWithImpl<$Res, EditCardState>;
  @useResult
  $Res call(
      {CardButtonState cardButtonState, List<Widget> editButtonInputList});
}

/// @nodoc
class _$EditCardStateCopyWithImpl<$Res, $Val extends EditCardState>
    implements $EditCardStateCopyWith<$Res> {
  _$EditCardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardButtonState = null,
    Object? editButtonInputList = null,
  }) {
    return _then(_value.copyWith(
      cardButtonState: null == cardButtonState
          ? _value.cardButtonState
          : cardButtonState // ignore: cast_nullable_to_non_nullable
              as CardButtonState,
      editButtonInputList: null == editButtonInputList
          ? _value.editButtonInputList
          : editButtonInputList // ignore: cast_nullable_to_non_nullable
              as List<Widget>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditCardStateImplCopyWith<$Res>
    implements $EditCardStateCopyWith<$Res> {
  factory _$$EditCardStateImplCopyWith(
          _$EditCardStateImpl value, $Res Function(_$EditCardStateImpl) then) =
      __$$EditCardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CardButtonState cardButtonState, List<Widget> editButtonInputList});
}

/// @nodoc
class __$$EditCardStateImplCopyWithImpl<$Res>
    extends _$EditCardStateCopyWithImpl<$Res, _$EditCardStateImpl>
    implements _$$EditCardStateImplCopyWith<$Res> {
  __$$EditCardStateImplCopyWithImpl(
      _$EditCardStateImpl _value, $Res Function(_$EditCardStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardButtonState = null,
    Object? editButtonInputList = null,
  }) {
    return _then(_$EditCardStateImpl(
      cardButtonState: null == cardButtonState
          ? _value.cardButtonState
          : cardButtonState // ignore: cast_nullable_to_non_nullable
              as CardButtonState,
      editButtonInputList: null == editButtonInputList
          ? _value._editButtonInputList
          : editButtonInputList // ignore: cast_nullable_to_non_nullable
              as List<Widget>,
    ));
  }
}

/// @nodoc

class _$EditCardStateImpl implements _EditCardState {
  const _$EditCardStateImpl(
      {required this.cardButtonState,
      required final List<Widget> editButtonInputList})
      : _editButtonInputList = editButtonInputList;

  @override
  final CardButtonState cardButtonState;
  final List<Widget> _editButtonInputList;
  @override
  List<Widget> get editButtonInputList {
    if (_editButtonInputList is EqualUnmodifiableListView)
      return _editButtonInputList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_editButtonInputList);
  }

  @override
  String toString() {
    return 'EditCardState(cardButtonState: $cardButtonState, editButtonInputList: $editButtonInputList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditCardStateImpl &&
            (identical(other.cardButtonState, cardButtonState) ||
                other.cardButtonState == cardButtonState) &&
            const DeepCollectionEquality()
                .equals(other._editButtonInputList, _editButtonInputList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cardButtonState,
      const DeepCollectionEquality().hash(_editButtonInputList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditCardStateImplCopyWith<_$EditCardStateImpl> get copyWith =>
      __$$EditCardStateImplCopyWithImpl<_$EditCardStateImpl>(this, _$identity);
}

abstract class _EditCardState implements EditCardState {
  const factory _EditCardState(
      {required final CardButtonState cardButtonState,
      required final List<Widget> editButtonInputList}) = _$EditCardStateImpl;

  @override
  CardButtonState get cardButtonState;
  @override
  List<Widget> get editButtonInputList;
  @override
  @JsonKey(ignore: true)
  _$$EditCardStateImplCopyWith<_$EditCardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
