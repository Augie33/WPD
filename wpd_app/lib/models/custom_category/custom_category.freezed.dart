// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'custom_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomCategory _$CustomCategoryFromJson(Map<String, dynamic> json) {
  return _CustomCategory.fromJson(json);
}

/// @nodoc
class _$CustomCategoryTearOff {
  const _$CustomCategoryTearOff();

  _CustomCategory call(
      {@JsonKey(name: '_id') required String id, required String title}) {
    return _CustomCategory(
      id: id,
      title: title,
    );
  }

  CustomCategory fromJson(Map<String, Object> json) {
    return CustomCategory.fromJson(json);
  }
}

/// @nodoc
const $CustomCategory = _$CustomCategoryTearOff();

/// @nodoc
mixin _$CustomCategory {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomCategoryCopyWith<CustomCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomCategoryCopyWith<$Res> {
  factory $CustomCategoryCopyWith(
          CustomCategory value, $Res Function(CustomCategory) then) =
      _$CustomCategoryCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: '_id') String id, String title});
}

/// @nodoc
class _$CustomCategoryCopyWithImpl<$Res>
    implements $CustomCategoryCopyWith<$Res> {
  _$CustomCategoryCopyWithImpl(this._value, this._then);

  final CustomCategory _value;
  // ignore: unused_field
  final $Res Function(CustomCategory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$CustomCategoryCopyWith<$Res>
    implements $CustomCategoryCopyWith<$Res> {
  factory _$CustomCategoryCopyWith(
          _CustomCategory value, $Res Function(_CustomCategory) then) =
      __$CustomCategoryCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: '_id') String id, String title});
}

/// @nodoc
class __$CustomCategoryCopyWithImpl<$Res>
    extends _$CustomCategoryCopyWithImpl<$Res>
    implements _$CustomCategoryCopyWith<$Res> {
  __$CustomCategoryCopyWithImpl(
      _CustomCategory _value, $Res Function(_CustomCategory) _then)
      : super(_value, (v) => _then(v as _CustomCategory));

  @override
  _CustomCategory get _value => super._value as _CustomCategory;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_CustomCategory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomCategory implements _CustomCategory {
  const _$_CustomCategory(
      {@JsonKey(name: '_id') required this.id, required this.title});

  factory _$_CustomCategory.fromJson(Map<String, dynamic> json) =>
      _$$_CustomCategoryFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String title;

  @override
  String toString() {
    return 'CustomCategory(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CustomCategory &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title);

  @JsonKey(ignore: true)
  @override
  _$CustomCategoryCopyWith<_CustomCategory> get copyWith =>
      __$CustomCategoryCopyWithImpl<_CustomCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomCategoryToJson(this);
  }
}

abstract class _CustomCategory implements CustomCategory {
  const factory _CustomCategory(
      {@JsonKey(name: '_id') required String id,
      required String title}) = _$_CustomCategory;

  factory _CustomCategory.fromJson(Map<String, dynamic> json) =
      _$_CustomCategory.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CustomCategoryCopyWith<_CustomCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
