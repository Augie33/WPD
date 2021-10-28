import 'package:wpd_app/models/custom_category/custom_category.dart';

import './json_parsers.dart';

class CategoryParser extends JsonParser<CustomCategory>
    with ObjectDecoder<CustomCategory> {
  const CategoryParser();

  @override
  Future<CustomCategory> parseFromJson(String json) async {
    final decoded = decodeJsonObject(json);
    return CustomCategory.fromJson(decoded['data']);
  }
}
