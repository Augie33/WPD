abstract class StorageService {
  Future<void> setData(String key, bool value);

  bool? getData(String key);
}
