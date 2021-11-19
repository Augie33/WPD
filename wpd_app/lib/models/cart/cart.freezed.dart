// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
class _$CartTearOff {
  const _$CartTearOff();

  _Cart call(
      {@JsonKey(name: '_id') required String id,
      required String caseNumber,
      required List<Case> cases}) {
    return _Cart(
      id: id,
      caseNumber: caseNumber,
      cases: cases,
    );
  }

  Cart fromJson(Map<String, Object> json) {
    return Cart.fromJson(json);
  }
}

/// @nodoc
const $Cart = _$CartTearOff();

/// @nodoc
mixin _$Cart {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get caseNumber => throw _privateConstructorUsedError;
  List<Case> get cases => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String id, String caseNumber, List<Case> cases});
}

/// @nodoc
class _$CartCopyWithImpl<$Res> implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  final Cart _value;
  // ignore: unused_field
  final $Res Function(Cart) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? caseNumber = freezed,
    Object? cases = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      caseNumber: caseNumber == freezed
          ? _value.caseNumber
          : caseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      cases: cases == freezed
          ? _value.cases
          : cases // ignore: cast_nullable_to_non_nullable
              as List<Case>,
    ));
  }
}

/// @nodoc
abstract class _$CartCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$CartCopyWith(_Cart value, $Res Function(_Cart) then) =
      __$CartCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String id, String caseNumber, List<Case> cases});
}

/// @nodoc
class __$CartCopyWithImpl<$Res> extends _$CartCopyWithImpl<$Res>
    implements _$CartCopyWith<$Res> {
  __$CartCopyWithImpl(_Cart _value, $Res Function(_Cart) _then)
      : super(_value, (v) => _then(v as _Cart));

  @override
  _Cart get _value => super._value as _Cart;

  @override
  $Res call({
    Object? id = freezed,
    Object? caseNumber = freezed,
    Object? cases = freezed,
  }) {
    return _then(_Cart(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      caseNumber: caseNumber == freezed
          ? _value.caseNumber
          : caseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      cases: cases == freezed
          ? _value.cases
          : cases // ignore: cast_nullable_to_non_nullable
              as List<Case>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Cart implements _Cart {
  const _$_Cart(
      {@JsonKey(name: '_id') required this.id,
      required this.caseNumber,
      required this.cases});

  factory _$_Cart.fromJson(Map<String, dynamic> json) => _$$_CartFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String caseNumber;
  @override
  final List<Case> cases;

  @override
  String toString() {
    return 'Cart(id: $id, caseNumber: $caseNumber, cases: $cases)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Cart &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.caseNumber, caseNumber) ||
                const DeepCollectionEquality()
                    .equals(other.caseNumber, caseNumber)) &&
            (identical(other.cases, cases) ||
                const DeepCollectionEquality().equals(other.cases, cases)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(caseNumber) ^
      const DeepCollectionEquality().hash(cases);

  @JsonKey(ignore: true)
  @override
  _$CartCopyWith<_Cart> get copyWith =>
      __$CartCopyWithImpl<_Cart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartToJson(this);
  }
}

abstract class _Cart implements Cart {
  const factory _Cart(
      {@JsonKey(name: '_id') required String id,
      required String caseNumber,
      required List<Case> cases}) = _$_Cart;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$_Cart.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @override
  String get caseNumber => throw _privateConstructorUsedError;
  @override
  List<Case> get cases => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CartCopyWith<_Cart> get copyWith => throw _privateConstructorUsedError;
}
