import 'package:wpd_app/models/cart/cart.dart';

import './json_parsers.dart';

class CartParser extends JsonParser<Cart> with ObjectDecoder<Cart> {
  const CartParser();

  @override
  Future<Cart> parseFromJson(String json) async {
    final decoded = decodeJsonObject(json);
    return Cart.fromJson(decoded['data']);
  }
}
