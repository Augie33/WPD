import 'package:cross_file/cross_file.dart';

abstract class FilePickerService {
  Future<XFile?> pickPdfFile();
}
