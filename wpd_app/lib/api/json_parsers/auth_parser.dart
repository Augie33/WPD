import 'package:wpd_app/models/auth/auth.dart';

import './json_parsers.dart';

class AuthParser extends JsonParser<Auth> with ObjectDecoder<Auth> {
  const AuthParser();

  @override
  Future<Auth> parseFromJson(String json) async {
    final decoded = decodeJsonObject(json);
    return Auth.fromJson(decoded);
  }
}
