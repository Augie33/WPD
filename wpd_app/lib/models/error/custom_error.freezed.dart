// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'custom_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomError _$CustomErrorFromJson(Map<String, dynamic> json) {
  return _CustomError.fromJson(json);
}

/// @nodoc
class _$CustomErrorTearOff {
  const _$CustomErrorTearOff();

  _CustomError call({required bool success, required String error}) {
    return _CustomError(
      success: success,
      error: error,
    );
  }

  CustomError fromJson(Map<String, Object> json) {
    return CustomError.fromJson(json);
  }
}

/// @nodoc
const $CustomError = _$CustomErrorTearOff();

/// @nodoc
mixin _$CustomError {
  bool get success => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomErrorCopyWith<CustomError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomErrorCopyWith<$Res> {
  factory $CustomErrorCopyWith(
          CustomError value, $Res Function(CustomError) then) =
      _$CustomErrorCopyWithImpl<$Res>;
  $Res call({bool success, String error});
}

/// @nodoc
class _$CustomErrorCopyWithImpl<$Res> implements $CustomErrorCopyWith<$Res> {
  _$CustomErrorCopyWithImpl(this._value, this._then);

  final CustomError _value;
  // ignore: unused_field
  final $Res Function(CustomError) _then;

  @override
  $Res call({
    Object? success = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CustomErrorCopyWith<$Res>
    implements $CustomErrorCopyWith<$Res> {
  factory _$CustomErrorCopyWith(
          _CustomError value, $Res Function(_CustomError) then) =
      __$CustomErrorCopyWithImpl<$Res>;
  @override
  $Res call({bool success, String error});
}

/// @nodoc
class __$CustomErrorCopyWithImpl<$Res> extends _$CustomErrorCopyWithImpl<$Res>
    implements _$CustomErrorCopyWith<$Res> {
  __$CustomErrorCopyWithImpl(
      _CustomError _value, $Res Function(_CustomError) _then)
      : super(_value, (v) => _then(v as _CustomError));

  @override
  _CustomError get _value => super._value as _CustomError;

  @override
  $Res call({
    Object? success = freezed,
    Object? error = freezed,
  }) {
    return _then(_CustomError(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomError implements _CustomError {
  const _$_CustomError({required this.success, required this.error});

  factory _$_CustomError.fromJson(Map<String, dynamic> json) =>
      _$$_CustomErrorFromJson(json);

  @override
  final bool success;
  @override
  final String error;

  @override
  String toString() {
    return 'CustomError(success: $success, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CustomError &&
            (identical(other.success, success) ||
                const DeepCollectionEquality()
                    .equals(other.success, success)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(success) ^
      const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$CustomErrorCopyWith<_CustomError> get copyWith =>
      __$CustomErrorCopyWithImpl<_CustomError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomErrorToJson(this);
  }
}

abstract class _CustomError implements CustomError {
  const factory _CustomError({required bool success, required String error}) =
      _$_CustomError;

  factory _CustomError.fromJson(Map<String, dynamic> json) =
      _$_CustomError.fromJson;

  @override
  bool get success => throw _privateConstructorUsedError;
  @override
  String get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CustomErrorCopyWith<_CustomError> get copyWith =>
      throw _privateConstructorUsedError;
}
