import 'package:wpd_app/api/json_parsers/json_parsers.dart';
import 'package:wpd_app/models/custom_category/custom_category.dart';

class CategoryListParser extends JsonParser<List<CustomCategory>>
    with ListDecoderData<List<CustomCategory>> {
  const CategoryListParser();

  @override
  Future<List<CustomCategory>> parseFromJson(String json) async {
    return decodeJsonList(json)
        .map((value) => CustomCategory.fromJson(value as Map<String, dynamic>))
        .toList();
  }
}
