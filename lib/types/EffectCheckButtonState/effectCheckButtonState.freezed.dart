// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'effectCheckButtonState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EffectCheckButtonState {
  String get description => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EffectCheckButtonStateCopyWith<EffectCheckButtonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EffectCheckButtonStateCopyWith<$Res> {
  factory $EffectCheckButtonStateCopyWith(EffectCheckButtonState value,
          $Res Function(EffectCheckButtonState) then) =
      _$EffectCheckButtonStateCopyWithImpl<$Res, EffectCheckButtonState>;
  @useResult
  $Res call({String description, int count, int limit});
}

/// @nodoc
class _$EffectCheckButtonStateCopyWithImpl<$Res,
        $Val extends EffectCheckButtonState>
    implements $EffectCheckButtonStateCopyWith<$Res> {
  _$EffectCheckButtonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? count = null,
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EffectCheckButtonStateImplCopyWith<$Res>
    implements $EffectCheckButtonStateCopyWith<$Res> {
  factory _$$EffectCheckButtonStateImplCopyWith(
          _$EffectCheckButtonStateImpl value,
          $Res Function(_$EffectCheckButtonStateImpl) then) =
      __$$EffectCheckButtonStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, int count, int limit});
}

/// @nodoc
class __$$EffectCheckButtonStateImplCopyWithImpl<$Res>
    extends _$EffectCheckButtonStateCopyWithImpl<$Res,
        _$EffectCheckButtonStateImpl>
    implements _$$EffectCheckButtonStateImplCopyWith<$Res> {
  __$$EffectCheckButtonStateImplCopyWithImpl(
      _$EffectCheckButtonStateImpl _value,
      $Res Function(_$EffectCheckButtonStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? count = null,
    Object? limit = null,
  }) {
    return _then(_$EffectCheckButtonStateImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$EffectCheckButtonStateImpl implements _EffectCheckButtonState {
  const _$EffectCheckButtonStateImpl(
      {required this.description, required this.count, required this.limit});

  @override
  final String description;
  @override
  final int count;
  @override
  final int limit;

  @override
  String toString() {
    return 'EffectCheckButtonState(description: $description, count: $count, limit: $limit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EffectCheckButtonStateImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description, count, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EffectCheckButtonStateImplCopyWith<_$EffectCheckButtonStateImpl>
      get copyWith => __$$EffectCheckButtonStateImplCopyWithImpl<
          _$EffectCheckButtonStateImpl>(this, _$identity);
}

abstract class _EffectCheckButtonState implements EffectCheckButtonState {
  const factory _EffectCheckButtonState(
      {required final String description,
      required final int count,
      required final int limit}) = _$EffectCheckButtonStateImpl;

  @override
  String get description;
  @override
  int get count;
  @override
  int get limit;
  @override
  @JsonKey(ignore: true)
  _$$EffectCheckButtonStateImplCopyWith<_$EffectCheckButtonStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
