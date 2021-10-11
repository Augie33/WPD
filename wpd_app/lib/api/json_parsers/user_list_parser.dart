import 'package:wpd_app/api/json_parsers/json_parsers.dart';
import 'package:wpd_app/models/user/user.dart';

class UserListParser extends JsonParser<List<User>>
    with ListDecoderData<List<User>> {
  const UserListParser();

  @override
  Future<List<User>> parseFromJson(String json) async {
    return decodeJsonList(json)
        .map((value) => User.fromJson(value as Map<String, dynamic>))
        .toList();
  }
}
