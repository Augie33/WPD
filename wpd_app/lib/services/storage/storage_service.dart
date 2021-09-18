abstract class StorageService {
  Future<void> setData(String key, String value);

  String? getData(String key);
}
