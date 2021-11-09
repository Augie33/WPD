// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cart _$$_CartFromJson(Map<String, dynamic> json) => _$_Cart(
      id: json['_id'] as String,
      cases: (json['cases'] as List<dynamic>)
          .map((e) => Case.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CartToJson(_$_Cart instance) => <String, dynamic>{
      '_id': instance.id,
      'cases': instance.cases.map((e) => e.toJson()).toList(),
    };
