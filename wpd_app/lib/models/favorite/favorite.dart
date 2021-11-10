import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wpd_app/models/case/case.dart';

part 'favorite.freezed.dart';
part 'favorite.g.dart';

@freezed
class Favorite with _$Favorite {
  @JsonSerializable(explicitToJson: true)
  const factory Favorite({
    @JsonKey(name: '_id') required String id,
    required List<Case> data,
  }) = _Favorite;

  factory Favorite.fromJson(Map<String, dynamic> json) =>
      _$FavoriteFromJson(json);
}
