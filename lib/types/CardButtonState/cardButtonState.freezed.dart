// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cardButtonState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CardButtonState {
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;
  List<ButtonWithOrderState> get buttonWithOrderState =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardButtonStateCopyWith<CardButtonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardButtonStateCopyWith<$Res> {
  factory $CardButtonStateCopyWith(
          CardButtonState value, $Res Function(CardButtonState) then) =
      _$CardButtonStateCopyWithImpl<$Res, CardButtonState>;
  @useResult
  $Res call(
      {String name,
      String image,
      Color color,
      List<ButtonWithOrderState> buttonWithOrderState});
}

/// @nodoc
class _$CardButtonStateCopyWithImpl<$Res, $Val extends CardButtonState>
    implements $CardButtonStateCopyWith<$Res> {
  _$CardButtonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
    Object? color = null,
    Object? buttonWithOrderState = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      buttonWithOrderState: null == buttonWithOrderState
          ? _value.buttonWithOrderState
          : buttonWithOrderState // ignore: cast_nullable_to_non_nullable
              as List<ButtonWithOrderState>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardButtonStateImplCopyWith<$Res>
    implements $CardButtonStateCopyWith<$Res> {
  factory _$$CardButtonStateImplCopyWith(_$CardButtonStateImpl value,
          $Res Function(_$CardButtonStateImpl) then) =
      __$$CardButtonStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String image,
      Color color,
      List<ButtonWithOrderState> buttonWithOrderState});
}

/// @nodoc
class __$$CardButtonStateImplCopyWithImpl<$Res>
    extends _$CardButtonStateCopyWithImpl<$Res, _$CardButtonStateImpl>
    implements _$$CardButtonStateImplCopyWith<$Res> {
  __$$CardButtonStateImplCopyWithImpl(
      _$CardButtonStateImpl _value, $Res Function(_$CardButtonStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
    Object? color = null,
    Object? buttonWithOrderState = null,
  }) {
    return _then(_$CardButtonStateImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      buttonWithOrderState: null == buttonWithOrderState
          ? _value._buttonWithOrderState
          : buttonWithOrderState // ignore: cast_nullable_to_non_nullable
              as List<ButtonWithOrderState>,
    ));
  }
}

/// @nodoc

class _$CardButtonStateImpl implements _CardButtonState {
  const _$CardButtonStateImpl(
      {required this.name,
      required this.image,
      required this.color,
      required final List<ButtonWithOrderState> buttonWithOrderState})
      : _buttonWithOrderState = buttonWithOrderState;

  @override
  final String name;
  @override
  final String image;
  @override
  final Color color;
  final List<ButtonWithOrderState> _buttonWithOrderState;
  @override
  List<ButtonWithOrderState> get buttonWithOrderState {
    if (_buttonWithOrderState is EqualUnmodifiableListView)
      return _buttonWithOrderState;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_buttonWithOrderState);
  }

  @override
  String toString() {
    return 'CardButtonState(name: $name, image: $image, color: $color, buttonWithOrderState: $buttonWithOrderState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardButtonStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.color, color) || other.color == color) &&
            const DeepCollectionEquality()
                .equals(other._buttonWithOrderState, _buttonWithOrderState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, image, color,
      const DeepCollectionEquality().hash(_buttonWithOrderState));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardButtonStateImplCopyWith<_$CardButtonStateImpl> get copyWith =>
      __$$CardButtonStateImplCopyWithImpl<_$CardButtonStateImpl>(
          this, _$identity);
}

abstract class _CardButtonState implements CardButtonState {
  const factory _CardButtonState(
          {required final String name,
          required final String image,
          required final Color color,
          required final List<ButtonWithOrderState> buttonWithOrderState}) =
      _$CardButtonStateImpl;

  @override
  String get name;
  @override
  String get image;
  @override
  Color get color;
  @override
  List<ButtonWithOrderState> get buttonWithOrderState;
  @override
  @JsonKey(ignore: true)
  _$$CardButtonStateImplCopyWith<_$CardButtonStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
