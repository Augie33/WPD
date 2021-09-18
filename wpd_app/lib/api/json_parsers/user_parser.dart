import 'package:wpd_app/models/user/user.dart';

import './json_parsers.dart';

class UserParser extends JsonParser<User> with ObjectDecoder<User> {
  const UserParser();

  @override
  Future<User> parseFromJson(String json) async {
    final decoded = decodeJsonObject(json);
    return User.fromJson(decoded);
  }
}
