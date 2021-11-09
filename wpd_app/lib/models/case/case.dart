import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wpd_app/models/custom_category/custom_category.dart';

part 'case.freezed.dart';
part 'case.g.dart';

@freezed
class Case with _$Case {
  @JsonSerializable(explicitToJson: true)
  const factory Case({
    @JsonKey(name: '_id') required String id,
    required String title,
    required int caseNumber,
    required CustomCategory category,
    required String description,
    required String url,
    required String urlPDF,
  }) = _Case;

  factory Case.fromJson(Map<String, dynamic> json) => _$CaseFromJson(json);
}
