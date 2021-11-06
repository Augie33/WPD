import 'package:cross_file/cross_file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:wpd_app/services/file_picker/file_picker_service.dart';

class FilePickerImpl implements FilePickerService {
  @override
  Future<XFile?> pickPdfFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        XFile file = XFile(result.files.single.path ?? '');
        return file;
      }
      return null;
    } catch (e) {}
  }
}
