import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wpd_app/models/case/case.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  @JsonSerializable(explicitToJson: true)
  const factory Cart({
    @JsonKey(name: '_id') required String id,
    required String caseNumber,
    required List<Case> cases,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
