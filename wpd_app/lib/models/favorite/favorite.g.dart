// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Favorite _$$_FavoriteFromJson(Map<String, dynamic> json) => _$_Favorite(
      id: json['_id'] as String,
      cases: (json['cases'] as List<dynamic>)
          .map((e) => Case.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FavoriteToJson(_$_Favorite instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'cases': instance.cases.map((e) => e.toJson()).toList(),
    };
