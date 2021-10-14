import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:wpd_app/services/online_storage/online_storage_service.dart';

class OnlineStorageImpl implements OnlineStorageService {
  @override
  Future<String?> uploadFile(Uint8List file, String name) async {
    await FirebaseStorage.instance.ref('uploads/$name').putData(file);
    final url = await FirebaseStorage.instance
        .ref('uploads/$name.pdf')
        .getDownloadURL();

    return url;
  }
}
