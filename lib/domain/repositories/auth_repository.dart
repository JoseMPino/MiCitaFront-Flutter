import 'package:mi_cita/domain/entities/auth_entity.dart';
import 'package:mi_cita/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<AuthEntity> login(String correo, String contrasena);
  Future<UserEntity> register(UserEntity user, String contrasena);
  Future<bool> isAuthenticated();
  Future<void> logout();
  Future<String?> getToken();
}