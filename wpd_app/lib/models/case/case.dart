import 'package:freezed_annotation/freezed_annotation.dart';

part 'case.freezed.dart';
part 'case.g.dart';

@freezed
class Case with _$Case {
  const factory Case({
    @JsonKey(name: '_id') required String id,
    required String title,
    required String description,
    required String url,
    required String urlPDF,
    required int caseNumber,
  }) = _Case;

  factory Case.fromJson(Map<String, dynamic> json) => _$CaseFromJson(json);
}
