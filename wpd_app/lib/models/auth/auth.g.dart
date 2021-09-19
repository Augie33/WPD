// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Auth _$$_AuthFromJson(Map<String, dynamic> json) => _$_Auth(
      success: json['success'] as bool,
      token: json['token'] as String,
      user: User.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AuthToJson(_$_Auth instance) => <String, dynamic>{
      'success': instance.success,
      'token': instance.token,
      'data': instance.user.toJson(),
    };
