import 'package:wpd_app/models/case/case.dart';

import './json_parsers.dart';

class CaseParser extends JsonParser<Case> with ObjectDecoder<Case> {
  const CaseParser();

  @override
  Future<Case> parseFromJson(String json) async {
    final decoded = decodeJsonObject(json);
    return Case.fromJson(decoded['data']);
  }
}
