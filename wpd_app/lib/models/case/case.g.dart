// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Case _$$_CaseFromJson(Map<String, dynamic> json) => _$_Case(
      id: json['_id'] as String,
      title: json['title'] as String,
      caseNumber: json['caseNumber'] as int,
      category:
          CustomCategory.fromJson(json['category'] as Map<String, dynamic>),
      description: json['description'] as String,
      url: json['url'] as String,
      urlPDF: json['urlPDF'] as String,
    );

Map<String, dynamic> _$$_CaseToJson(_$_Case instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'caseNumber': instance.caseNumber,
      'category': instance.category.toJson(),
      'description': instance.description,
      'url': instance.url,
      'urlPDF': instance.urlPDF,
    };
