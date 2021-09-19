abstract class ScureStorageService {
  Future<void> setToken(String token);

  Future<String?> getToken();

  Future<bool> deleteToken();
}
