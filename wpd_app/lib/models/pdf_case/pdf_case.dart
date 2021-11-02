import 'package:freezed_annotation/freezed_annotation.dart';

part 'pdf_case.freezed.dart';
part 'pdf_case.g.dart';

@freezed
class PDFCase with _$PDFCase {
  const factory PDFCase({
    required String id,
    required String originalname,
    required String fileName,
    required String urlPDF,
    required String mimetype,
  }) = _PDFCase;

  factory PDFCase.fromJson(Map<String, dynamic> json) =>
      _$PDFCaseFromJson(json);
}
