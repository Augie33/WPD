import 'package:wpd_app/models/custom_file/custom_file.dart';

import './json_parsers.dart';

class FileParser extends JsonParser<CustomFile> with ObjectDecoder<CustomFile> {
  const FileParser();

  @override
  Future<CustomFile> parseFromJson(String json) async {
    final decoded = decodeJsonObject(json);
    return CustomFile.fromJson(decoded);
  }
}
