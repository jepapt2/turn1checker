// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_data_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocalDataOptions {
  int get deckSlot => throw _privateConstructorUsedError;
  bool get noAds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalDataOptionsCopyWith<LocalDataOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalDataOptionsCopyWith<$Res> {
  factory $LocalDataOptionsCopyWith(
          LocalDataOptions value, $Res Function(LocalDataOptions) then) =
      _$LocalDataOptionsCopyWithImpl<$Res, LocalDataOptions>;
  @useResult
  $Res call({int deckSlot, bool noAds});
}

/// @nodoc
class _$LocalDataOptionsCopyWithImpl<$Res, $Val extends LocalDataOptions>
    implements $LocalDataOptionsCopyWith<$Res> {
  _$LocalDataOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deckSlot = null,
    Object? noAds = null,
  }) {
    return _then(_value.copyWith(
      deckSlot: null == deckSlot
          ? _value.deckSlot
          : deckSlot // ignore: cast_nullable_to_non_nullable
              as int,
      noAds: null == noAds
          ? _value.noAds
          : noAds // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalDataOptionsImplCopyWith<$Res>
    implements $LocalDataOptionsCopyWith<$Res> {
  factory _$$LocalDataOptionsImplCopyWith(_$LocalDataOptionsImpl value,
          $Res Function(_$LocalDataOptionsImpl) then) =
      __$$LocalDataOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int deckSlot, bool noAds});
}

/// @nodoc
class __$$LocalDataOptionsImplCopyWithImpl<$Res>
    extends _$LocalDataOptionsCopyWithImpl<$Res, _$LocalDataOptionsImpl>
    implements _$$LocalDataOptionsImplCopyWith<$Res> {
  __$$LocalDataOptionsImplCopyWithImpl(_$LocalDataOptionsImpl _value,
      $Res Function(_$LocalDataOptionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deckSlot = null,
    Object? noAds = null,
  }) {
    return _then(_$LocalDataOptionsImpl(
      deckSlot: null == deckSlot
          ? _value.deckSlot
          : deckSlot // ignore: cast_nullable_to_non_nullable
              as int,
      noAds: null == noAds
          ? _value.noAds
          : noAds // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LocalDataOptionsImpl implements _LocalDataOptions {
  const _$LocalDataOptionsImpl({required this.deckSlot, required this.noAds});

  @override
  final int deckSlot;
  @override
  final bool noAds;

  @override
  String toString() {
    return 'LocalDataOptions(deckSlot: $deckSlot, noAds: $noAds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalDataOptionsImpl &&
            (identical(other.deckSlot, deckSlot) ||
                other.deckSlot == deckSlot) &&
            (identical(other.noAds, noAds) || other.noAds == noAds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deckSlot, noAds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalDataOptionsImplCopyWith<_$LocalDataOptionsImpl> get copyWith =>
      __$$LocalDataOptionsImplCopyWithImpl<_$LocalDataOptionsImpl>(
          this, _$identity);
}

abstract class _LocalDataOptions implements LocalDataOptions {
  const factory _LocalDataOptions(
      {required final int deckSlot,
      required final bool noAds}) = _$LocalDataOptionsImpl;

  @override
  int get deckSlot;
  @override
  bool get noAds;
  @override
  @JsonKey(ignore: true)
  _$$LocalDataOptionsImplCopyWith<_$LocalDataOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
