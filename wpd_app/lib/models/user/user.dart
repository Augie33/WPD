import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @JsonKey(name: '_id') required String id,
    required String firstName,
    required String lastName,
    required String rank,
    required String email,
    required String phoneNumber,
    required String department,
    required String stationPhoneNumber,
    required String role,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
