import './json_parsers.dart';

class VoidParser extends JsonParser<void> with ObjectDecoder<void> {
  const VoidParser();

  @override
  Future<void> parseFromJson(String json) async {}
}
