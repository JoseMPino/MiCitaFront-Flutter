abstract class LocalStorageDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> saveUserData(String email, String role);
  Future<void> clearAll();
}