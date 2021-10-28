import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_category.freezed.dart';
part 'custom_category.g.dart';

@freezed
class CustomCategory with _$CustomCategory {
  const factory CustomCategory({
    @JsonKey(name: '_id') required String id,
    required String title,
  }) = _CustomCategory;

  factory CustomCategory.fromJson(Map<String, dynamic> json) =>
      _$CustomCategoryFromJson(json);
}
