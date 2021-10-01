// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      rank: json['rank'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      department: json['department'] as String,
      stationPhoneNumber: json['stationPhoneNumber'] as String,
      role: json['role'] as String? ?? 'police',
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'rank': instance.rank,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'department': instance.department,
      'stationPhoneNumber': instance.stationPhoneNumber,
      'role': instance.role,
    };
