// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'custom_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomFile _$CustomFileFromJson(Map<String, dynamic> json) {
  return _CustomFile.fromJson(json);
}

/// @nodoc
class _$CustomFileTearOff {
  const _$CustomFileTearOff();

  _CustomFile call({required bool success, required String data}) {
    return _CustomFile(
      success: success,
      data: data,
    );
  }

  CustomFile fromJson(Map<String, Object> json) {
    return CustomFile.fromJson(json);
  }
}

/// @nodoc
const $CustomFile = _$CustomFileTearOff();

/// @nodoc
mixin _$CustomFile {
  bool get success => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomFileCopyWith<CustomFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomFileCopyWith<$Res> {
  factory $CustomFileCopyWith(
          CustomFile value, $Res Function(CustomFile) then) =
      _$CustomFileCopyWithImpl<$Res>;
  $Res call({bool success, String data});
}

/// @nodoc
class _$CustomFileCopyWithImpl<$Res> implements $CustomFileCopyWith<$Res> {
  _$CustomFileCopyWithImpl(this._value, this._then);

  final CustomFile _value;
  // ignore: unused_field
  final $Res Function(CustomFile) _then;

  @override
  $Res call({
    Object? success = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CustomFileCopyWith<$Res> implements $CustomFileCopyWith<$Res> {
  factory _$CustomFileCopyWith(
          _CustomFile value, $Res Function(_CustomFile) then) =
      __$CustomFileCopyWithImpl<$Res>;
  @override
  $Res call({bool success, String data});
}

/// @nodoc
class __$CustomFileCopyWithImpl<$Res> extends _$CustomFileCopyWithImpl<$Res>
    implements _$CustomFileCopyWith<$Res> {
  __$CustomFileCopyWithImpl(
      _CustomFile _value, $Res Function(_CustomFile) _then)
      : super(_value, (v) => _then(v as _CustomFile));

  @override
  _CustomFile get _value => super._value as _CustomFile;

  @override
  $Res call({
    Object? success = freezed,
    Object? data = freezed,
  }) {
    return _then(_CustomFile(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomFile implements _CustomFile {
  const _$_CustomFile({required this.success, required this.data});

  factory _$_CustomFile.fromJson(Map<String, dynamic> json) =>
      _$$_CustomFileFromJson(json);

  @override
  final bool success;
  @override
  final String data;

  @override
  String toString() {
    return 'CustomFile(success: $success, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CustomFile &&
            (identical(other.success, success) ||
                const DeepCollectionEquality()
                    .equals(other.success, success)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(success) ^
      const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$CustomFileCopyWith<_CustomFile> get copyWith =>
      __$CustomFileCopyWithImpl<_CustomFile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomFileToJson(this);
  }
}

abstract class _CustomFile implements CustomFile {
  const factory _CustomFile({required bool success, required String data}) =
      _$_CustomFile;

  factory _CustomFile.fromJson(Map<String, dynamic> json) =
      _$_CustomFile.fromJson;

  @override
  bool get success => throw _privateConstructorUsedError;
  @override
  String get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CustomFileCopyWith<_CustomFile> get copyWith =>
      throw _privateConstructorUsedError;
}
