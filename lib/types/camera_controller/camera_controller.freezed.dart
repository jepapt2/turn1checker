// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CameraControllerWithOption {
  CameraController get cameraController => throw _privateConstructorUsedError;
  CameraOption get cameraOption => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CameraControllerWithOptionCopyWith<CameraControllerWithOption>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraControllerWithOptionCopyWith<$Res> {
  factory $CameraControllerWithOptionCopyWith(CameraControllerWithOption value,
          $Res Function(CameraControllerWithOption) then) =
      _$CameraControllerWithOptionCopyWithImpl<$Res,
          CameraControllerWithOption>;
  @useResult
  $Res call({CameraController cameraController, CameraOption cameraOption});

  $CameraOptionCopyWith<$Res> get cameraOption;
}

/// @nodoc
class _$CameraControllerWithOptionCopyWithImpl<$Res,
        $Val extends CameraControllerWithOption>
    implements $CameraControllerWithOptionCopyWith<$Res> {
  _$CameraControllerWithOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cameraController = null,
    Object? cameraOption = null,
  }) {
    return _then(_value.copyWith(
      cameraController: null == cameraController
          ? _value.cameraController
          : cameraController // ignore: cast_nullable_to_non_nullable
              as CameraController,
      cameraOption: null == cameraOption
          ? _value.cameraOption
          : cameraOption // ignore: cast_nullable_to_non_nullable
              as CameraOption,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CameraOptionCopyWith<$Res> get cameraOption {
    return $CameraOptionCopyWith<$Res>(_value.cameraOption, (value) {
      return _then(_value.copyWith(cameraOption: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CameraControllerWithOptionImplCopyWith<$Res>
    implements $CameraControllerWithOptionCopyWith<$Res> {
  factory _$$CameraControllerWithOptionImplCopyWith(
          _$CameraControllerWithOptionImpl value,
          $Res Function(_$CameraControllerWithOptionImpl) then) =
      __$$CameraControllerWithOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CameraController cameraController, CameraOption cameraOption});

  @override
  $CameraOptionCopyWith<$Res> get cameraOption;
}

/// @nodoc
class __$$CameraControllerWithOptionImplCopyWithImpl<$Res>
    extends _$CameraControllerWithOptionCopyWithImpl<$Res,
        _$CameraControllerWithOptionImpl>
    implements _$$CameraControllerWithOptionImplCopyWith<$Res> {
  __$$CameraControllerWithOptionImplCopyWithImpl(
      _$CameraControllerWithOptionImpl _value,
      $Res Function(_$CameraControllerWithOptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cameraController = null,
    Object? cameraOption = null,
  }) {
    return _then(_$CameraControllerWithOptionImpl(
      cameraController: null == cameraController
          ? _value.cameraController
          : cameraController // ignore: cast_nullable_to_non_nullable
              as CameraController,
      cameraOption: null == cameraOption
          ? _value.cameraOption
          : cameraOption // ignore: cast_nullable_to_non_nullable
              as CameraOption,
    ));
  }
}

/// @nodoc

class _$CameraControllerWithOptionImpl implements _CameraControllerWithOption {
  const _$CameraControllerWithOptionImpl(
      {required this.cameraController, required this.cameraOption});

  @override
  final CameraController cameraController;
  @override
  final CameraOption cameraOption;

  @override
  String toString() {
    return 'CameraControllerWithOption(cameraController: $cameraController, cameraOption: $cameraOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraControllerWithOptionImpl &&
            (identical(other.cameraController, cameraController) ||
                other.cameraController == cameraController) &&
            (identical(other.cameraOption, cameraOption) ||
                other.cameraOption == cameraOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cameraController, cameraOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraControllerWithOptionImplCopyWith<_$CameraControllerWithOptionImpl>
      get copyWith => __$$CameraControllerWithOptionImplCopyWithImpl<
          _$CameraControllerWithOptionImpl>(this, _$identity);
}

abstract class _CameraControllerWithOption
    implements CameraControllerWithOption {
  const factory _CameraControllerWithOption(
          {required final CameraController cameraController,
          required final CameraOption cameraOption}) =
      _$CameraControllerWithOptionImpl;

  @override
  CameraController get cameraController;
  @override
  CameraOption get cameraOption;
  @override
  @JsonKey(ignore: true)
  _$$CameraControllerWithOptionImplCopyWith<_$CameraControllerWithOptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CameraOption {
  double get maxZoomLevel => throw _privateConstructorUsedError;
  double get minZoomLevel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CameraOptionCopyWith<CameraOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraOptionCopyWith<$Res> {
  factory $CameraOptionCopyWith(
          CameraOption value, $Res Function(CameraOption) then) =
      _$CameraOptionCopyWithImpl<$Res, CameraOption>;
  @useResult
  $Res call({double maxZoomLevel, double minZoomLevel});
}

/// @nodoc
class _$CameraOptionCopyWithImpl<$Res, $Val extends CameraOption>
    implements $CameraOptionCopyWith<$Res> {
  _$CameraOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxZoomLevel = null,
    Object? minZoomLevel = null,
  }) {
    return _then(_value.copyWith(
      maxZoomLevel: null == maxZoomLevel
          ? _value.maxZoomLevel
          : maxZoomLevel // ignore: cast_nullable_to_non_nullable
              as double,
      minZoomLevel: null == minZoomLevel
          ? _value.minZoomLevel
          : minZoomLevel // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CameraOptionImplCopyWith<$Res>
    implements $CameraOptionCopyWith<$Res> {
  factory _$$CameraOptionImplCopyWith(
          _$CameraOptionImpl value, $Res Function(_$CameraOptionImpl) then) =
      __$$CameraOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double maxZoomLevel, double minZoomLevel});
}

/// @nodoc
class __$$CameraOptionImplCopyWithImpl<$Res>
    extends _$CameraOptionCopyWithImpl<$Res, _$CameraOptionImpl>
    implements _$$CameraOptionImplCopyWith<$Res> {
  __$$CameraOptionImplCopyWithImpl(
      _$CameraOptionImpl _value, $Res Function(_$CameraOptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxZoomLevel = null,
    Object? minZoomLevel = null,
  }) {
    return _then(_$CameraOptionImpl(
      maxZoomLevel: null == maxZoomLevel
          ? _value.maxZoomLevel
          : maxZoomLevel // ignore: cast_nullable_to_non_nullable
              as double,
      minZoomLevel: null == minZoomLevel
          ? _value.minZoomLevel
          : minZoomLevel // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$CameraOptionImpl implements _CameraOption {
  const _$CameraOptionImpl(
      {required this.maxZoomLevel, required this.minZoomLevel});

  @override
  final double maxZoomLevel;
  @override
  final double minZoomLevel;

  @override
  String toString() {
    return 'CameraOption(maxZoomLevel: $maxZoomLevel, minZoomLevel: $minZoomLevel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraOptionImpl &&
            (identical(other.maxZoomLevel, maxZoomLevel) ||
                other.maxZoomLevel == maxZoomLevel) &&
            (identical(other.minZoomLevel, minZoomLevel) ||
                other.minZoomLevel == minZoomLevel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, maxZoomLevel, minZoomLevel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraOptionImplCopyWith<_$CameraOptionImpl> get copyWith =>
      __$$CameraOptionImplCopyWithImpl<_$CameraOptionImpl>(this, _$identity);
}

abstract class _CameraOption implements CameraOption {
  const factory _CameraOption(
      {required final double maxZoomLevel,
      required final double minZoomLevel}) = _$CameraOptionImpl;

  @override
  double get maxZoomLevel;
  @override
  double get minZoomLevel;
  @override
  @JsonKey(ignore: true)
  _$$CameraOptionImplCopyWith<_$CameraOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
