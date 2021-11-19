import 'package:shared_preferences/shared_preferences.dart';
import 'package:wpd_app/services/storage/storage_service.dart';

class StorageServiceImpl implements StorageService {
  StorageServiceImpl({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  Future<void> setData(String key, bool value) async {
    await sharedPreferences.setBool(key, value);
  }

  @override
  bool? getData(String key) {
    return sharedPreferences.getBool(key);
  }
}
