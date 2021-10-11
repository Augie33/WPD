import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:wpd_app/services/file_picker/file_picker_service.dart';

class FilePickerImpl implements FilePickerService {
  @override
  Future<File?> pickPdfFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        final path = result.files.single.path;
        if (path == null) {
          return null;
        }

        File? file = File(result.files.single.path ?? '');

        return file;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }
}
