import 'dart:convert';

import 'package:wpd_app/api/json_parsers/json_parsers.dart';
import 'package:wpd_app/models/case/case.dart';

class CaseListParser extends JsonParser<List<Case>>
    with ListDecoderData<List<Case>> {
  const CaseListParser();

  @override
  Future<List<Case>> parseFromJson(String json) async {
    return decodeJsonList(json).map((value) => Case.fromJson(value)).toList();
  }
}
