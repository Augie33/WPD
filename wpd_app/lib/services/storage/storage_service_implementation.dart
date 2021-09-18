import 'package:shared_preferences/shared_preferences.dart';
import 'package:wpd_app/services/storage/storage_service.dart';

class StorageServiceImpl implements StorageService {
  StorageServiceImpl({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  Future<void> setData(String key, String value) async {
    await sharedPreferences.setString(key, value);
  }

  @override
  String? getData(String key) {
    return sharedPreferences.getString(key);
  }
}
