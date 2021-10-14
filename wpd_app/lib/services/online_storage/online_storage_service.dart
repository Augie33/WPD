import 'dart:typed_data';

abstract class OnlineStorageService {
  Future<String?> uploadFile(Uint8List file, String name);
}
