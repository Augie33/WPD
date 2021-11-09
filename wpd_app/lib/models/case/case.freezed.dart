// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Case _$CaseFromJson(Map<String, dynamic> json) {
  return _Case.fromJson(json);
}

/// @nodoc
class _$CaseTearOff {
  const _$CaseTearOff();

  _Case call(
      {@JsonKey(name: '_id') required String id,
      required String title,
      required int caseNumber,
      required CustomCategory category,
      required String description,
      required String url,
      required String urlPDF}) {
    return _Case(
      id: id,
      title: title,
      caseNumber: caseNumber,
      category: category,
      description: description,
      url: url,
      urlPDF: urlPDF,
    );
  }

  Case fromJson(Map<String, Object> json) {
    return Case.fromJson(json);
  }
}

/// @nodoc
const $Case = _$CaseTearOff();

/// @nodoc
mixin _$Case {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get caseNumber => throw _privateConstructorUsedError;
  CustomCategory get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get urlPDF => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CaseCopyWith<Case> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaseCopyWith<$Res> {
  factory $CaseCopyWith(Case value, $Res Function(Case) then) =
      _$CaseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String id,
      String title,
      int caseNumber,
      CustomCategory category,
      String description,
      String url,
      String urlPDF});

  $CustomCategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$CaseCopyWithImpl<$Res> implements $CaseCopyWith<$Res> {
  _$CaseCopyWithImpl(this._value, this._then);

  final Case _value;
  // ignore: unused_field
  final $Res Function(Case) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? caseNumber = freezed,
    Object? category = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? urlPDF = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      caseNumber: caseNumber == freezed
          ? _value.caseNumber
          : caseNumber // ignore: cast_nullable_to_non_nullable
              as int,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CustomCategory,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      urlPDF: urlPDF == freezed
          ? _value.urlPDF
          : urlPDF // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $CustomCategoryCopyWith<$Res> get category {
    return $CustomCategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value));
    });
  }
}

/// @nodoc
abstract class _$CaseCopyWith<$Res> implements $CaseCopyWith<$Res> {
  factory _$CaseCopyWith(_Case value, $Res Function(_Case) then) =
      __$CaseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String id,
      String title,
      int caseNumber,
      CustomCategory category,
      String description,
      String url,
      String urlPDF});

  @override
  $CustomCategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$CaseCopyWithImpl<$Res> extends _$CaseCopyWithImpl<$Res>
    implements _$CaseCopyWith<$Res> {
  __$CaseCopyWithImpl(_Case _value, $Res Function(_Case) _then)
      : super(_value, (v) => _then(v as _Case));

  @override
  _Case get _value => super._value as _Case;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? caseNumber = freezed,
    Object? category = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? urlPDF = freezed,
  }) {
    return _then(_Case(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      caseNumber: caseNumber == freezed
          ? _value.caseNumber
          : caseNumber // ignore: cast_nullable_to_non_nullable
              as int,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CustomCategory,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      urlPDF: urlPDF == freezed
          ? _value.urlPDF
          : urlPDF // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Case implements _Case {
  const _$_Case(
      {@JsonKey(name: '_id') required this.id,
      required this.title,
      required this.caseNumber,
      required this.category,
      required this.description,
      required this.url,
      required this.urlPDF});

  factory _$_Case.fromJson(Map<String, dynamic> json) => _$$_CaseFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String title;
  @override
  final int caseNumber;
  @override
  final CustomCategory category;
  @override
  final String description;
  @override
  final String url;
  @override
  final String urlPDF;

  @override
  String toString() {
    return 'Case(id: $id, title: $title, caseNumber: $caseNumber, category: $category, description: $description, url: $url, urlPDF: $urlPDF)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Case &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.caseNumber, caseNumber) ||
                const DeepCollectionEquality()
                    .equals(other.caseNumber, caseNumber)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.urlPDF, urlPDF) ||
                const DeepCollectionEquality().equals(other.urlPDF, urlPDF)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(caseNumber) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(urlPDF);

  @JsonKey(ignore: true)
  @override
  _$CaseCopyWith<_Case> get copyWith =>
      __$CaseCopyWithImpl<_Case>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CaseToJson(this);
  }
}

abstract class _Case implements Case {
  const factory _Case(
      {@JsonKey(name: '_id') required String id,
      required String title,
      required int caseNumber,
      required CustomCategory category,
      required String description,
      required String url,
      required String urlPDF}) = _$_Case;

  factory _Case.fromJson(Map<String, dynamic> json) = _$_Case.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  int get caseNumber => throw _privateConstructorUsedError;
  @override
  CustomCategory get category => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  String get urlPDF => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CaseCopyWith<_Case> get copyWith => throw _privateConstructorUsedError;
}
