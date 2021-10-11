import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_file.freezed.dart';
part 'custom_file.g.dart';

@freezed
class CustomFile with _$CustomFile {
  const factory CustomFile({
    required bool success,
    required String data,
  }) = _CustomFile;

  factory CustomFile.fromJson(Map<String, dynamic> json) =>
      _$CustomFileFromJson(json);
}
