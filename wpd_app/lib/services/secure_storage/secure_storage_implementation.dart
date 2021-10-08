import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:wpd_app/services/secure_storage/secure_storage_service.dart';

class SecureStorageImpl implements ScureStorageService {
  final storage = const FlutterSecureStorage();

  @override
  Future<String?> getToken() async {
    String? value = '';
    try {
      value = await storage.read(key: 'token');
      if (value == null) {
        return '';
      }
      // ignore: empty_catches
    } catch (e) {}

    return value;
  }

  @override
  Future<void> setToken(String token) async {
    try {
      await storage.write(key: 'token', value: token);
    } catch (e) {
      // print(e);
    }
  }

  @override
  Future<bool> deleteToken() async {
    try {
      await storage.delete(key: 'token');
      return true;
    } catch (e) {
      // print(e);
    }

    return false;
  }
}
