import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:wpd_app/services/file_picker/file_picker_service.dart';

class FilePickerImpl implements FilePickerService {
  @override
  Future<File?> pickPdfFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        File file = File(result.files.single.path ?? '');
        return file;
      }
      return null;
    } catch (e) {
      print(e);
    }
  }
}
