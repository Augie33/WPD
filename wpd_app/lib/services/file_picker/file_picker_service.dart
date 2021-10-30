import 'dart:io';

abstract class FilePickerService {
  Future<File?> pickPdfFile();
}
