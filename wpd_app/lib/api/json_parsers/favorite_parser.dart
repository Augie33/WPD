import 'package:wpd_app/models/custom_category/custom_category.dart';
import 'package:wpd_app/models/favorite/favorite.dart';

import './json_parsers.dart';

class FavoriteParser extends JsonParser<Favorite> with ObjectDecoder<Favorite> {
  const FavoriteParser();

  @override
  Future<Favorite> parseFromJson(String json) async {
    final decoded = decodeJsonObject(json);
    return Favorite.fromJson(decoded['data']);
  }
}
