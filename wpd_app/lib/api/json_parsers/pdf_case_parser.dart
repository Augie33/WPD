import 'package:wpd_app/models/pdf_case/pdf_case.dart';

import './json_parsers.dart';

class PDFCaseParser extends JsonParser<PDFCase> with ObjectDecoder<PDFCase> {
  const PDFCaseParser();

  @override
  Future<PDFCase> parseFromJson(String json) async {
    final decoded = decodeJsonObject(json);
    return PDFCase.fromJson(decoded['data']);
  }
}
