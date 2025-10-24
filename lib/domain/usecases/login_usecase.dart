import 'package:mi_cita/domain/entities/auth_entity.dart';
import 'package:mi_cita/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<AuthEntity> call(String correo, String contrasena) {
    return repository.login(correo, contrasena);
  }
}
