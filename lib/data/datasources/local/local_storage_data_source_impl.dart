import 'package:mi_cita/core/constants/app_constants.dart';
import 'package:mi_cita/data/datasources/local/local_storage_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LocalStorageDataSourceImpl implements LocalStorageDataSource {
  @override
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.tokenKey, token);
  }

  @override
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.tokenKey);
  }

  @override
  Future<void> saveUserData(String email, String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.userEmailKey, email);
    await prefs.setString(AppConstants.userRoleKey, role);
  }

  @override
  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.tokenKey);
    await prefs.remove(AppConstants.userEmailKey);
    await prefs.remove(AppConstants.userRoleKey);
  }
}