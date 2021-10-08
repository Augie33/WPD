import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wpd_app/models/user/user.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
class Auth with _$Auth {
  @JsonSerializable(explicitToJson: true)
  const factory Auth({
    required bool success,
    required String token,
    @JsonKey(name: 'data') required User user,
  }) = _Auth;

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}
