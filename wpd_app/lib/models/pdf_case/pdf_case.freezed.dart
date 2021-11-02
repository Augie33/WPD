// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pdf_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PDFCase _$PDFCaseFromJson(Map<String, dynamic> json) {
  return _PDFCase.fromJson(json);
}

/// @nodoc
class _$PDFCaseTearOff {
  const _$PDFCaseTearOff();

  _PDFCase call(
      {required String id,
      required String originalname,
      required String fileName,
      required String urlPDF,
      required String mimetype}) {
    return _PDFCase(
      id: id,
      originalname: originalname,
      fileName: fileName,
      urlPDF: urlPDF,
      mimetype: mimetype,
    );
  }

  PDFCase fromJson(Map<String, Object> json) {
    return PDFCase.fromJson(json);
  }
}

/// @nodoc
const $PDFCase = _$PDFCaseTearOff();

/// @nodoc
mixin _$PDFCase {
  String get id => throw _privateConstructorUsedError;
  String get originalname => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  String get urlPDF => throw _privateConstructorUsedError;
  String get mimetype => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PDFCaseCopyWith<PDFCase> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PDFCaseCopyWith<$Res> {
  factory $PDFCaseCopyWith(PDFCase value, $Res Function(PDFCase) then) =
      _$PDFCaseCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String originalname,
      String fileName,
      String urlPDF,
      String mimetype});
}

/// @nodoc
class _$PDFCaseCopyWithImpl<$Res> implements $PDFCaseCopyWith<$Res> {
  _$PDFCaseCopyWithImpl(this._value, this._then);

  final PDFCase _value;
  // ignore: unused_field
  final $Res Function(PDFCase) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? originalname = freezed,
    Object? fileName = freezed,
    Object? urlPDF = freezed,
    Object? mimetype = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      originalname: originalname == freezed
          ? _value.originalname
          : originalname // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      urlPDF: urlPDF == freezed
          ? _value.urlPDF
          : urlPDF // ignore: cast_nullable_to_non_nullable
              as String,
      mimetype: mimetype == freezed
          ? _value.mimetype
          : mimetype // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PDFCaseCopyWith<$Res> implements $PDFCaseCopyWith<$Res> {
  factory _$PDFCaseCopyWith(_PDFCase value, $Res Function(_PDFCase) then) =
      __$PDFCaseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String originalname,
      String fileName,
      String urlPDF,
      String mimetype});
}

/// @nodoc
class __$PDFCaseCopyWithImpl<$Res> extends _$PDFCaseCopyWithImpl<$Res>
    implements _$PDFCaseCopyWith<$Res> {
  __$PDFCaseCopyWithImpl(_PDFCase _value, $Res Function(_PDFCase) _then)
      : super(_value, (v) => _then(v as _PDFCase));

  @override
  _PDFCase get _value => super._value as _PDFCase;

  @override
  $Res call({
    Object? id = freezed,
    Object? originalname = freezed,
    Object? fileName = freezed,
    Object? urlPDF = freezed,
    Object? mimetype = freezed,
  }) {
    return _then(_PDFCase(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      originalname: originalname == freezed
          ? _value.originalname
          : originalname // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      urlPDF: urlPDF == freezed
          ? _value.urlPDF
          : urlPDF // ignore: cast_nullable_to_non_nullable
              as String,
      mimetype: mimetype == freezed
          ? _value.mimetype
          : mimetype // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PDFCase implements _PDFCase {
  const _$_PDFCase(
      {required this.id,
      required this.originalname,
      required this.fileName,
      required this.urlPDF,
      required this.mimetype});

  factory _$_PDFCase.fromJson(Map<String, dynamic> json) =>
      _$$_PDFCaseFromJson(json);

  @override
  final String id;
  @override
  final String originalname;
  @override
  final String fileName;
  @override
  final String urlPDF;
  @override
  final String mimetype;

  @override
  String toString() {
    return 'PDFCase(id: $id, originalname: $originalname, fileName: $fileName, urlPDF: $urlPDF, mimetype: $mimetype)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PDFCase &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.originalname, originalname) ||
                const DeepCollectionEquality()
                    .equals(other.originalname, originalname)) &&
            (identical(other.fileName, fileName) ||
                const DeepCollectionEquality()
                    .equals(other.fileName, fileName)) &&
            (identical(other.urlPDF, urlPDF) ||
                const DeepCollectionEquality().equals(other.urlPDF, urlPDF)) &&
            (identical(other.mimetype, mimetype) ||
                const DeepCollectionEquality()
                    .equals(other.mimetype, mimetype)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(originalname) ^
      const DeepCollectionEquality().hash(fileName) ^
      const DeepCollectionEquality().hash(urlPDF) ^
      const DeepCollectionEquality().hash(mimetype);

  @JsonKey(ignore: true)
  @override
  _$PDFCaseCopyWith<_PDFCase> get copyWith =>
      __$PDFCaseCopyWithImpl<_PDFCase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PDFCaseToJson(this);
  }
}

abstract class _PDFCase implements PDFCase {
  const factory _PDFCase(
      {required String id,
      required String originalname,
      required String fileName,
      required String urlPDF,
      required String mimetype}) = _$_PDFCase;

  factory _PDFCase.fromJson(Map<String, dynamic> json) = _$_PDFCase.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get originalname => throw _privateConstructorUsedError;
  @override
  String get fileName => throw _privateConstructorUsedError;
  @override
  String get urlPDF => throw _privateConstructorUsedError;
  @override
  String get mimetype => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PDFCaseCopyWith<_PDFCase> get copyWith =>
      throw _privateConstructorUsedError;
}
