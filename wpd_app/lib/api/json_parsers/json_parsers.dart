library json_parser;

export 'object_decoder.dart';

abstract class JsonParser<T> {
  const JsonParser();

  Future<T> parseFromJson(String json);
}
