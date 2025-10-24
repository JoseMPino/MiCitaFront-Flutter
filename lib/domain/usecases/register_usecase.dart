import 'package:mi_cita/domain/entities/user_entity.dart';
import 'package:mi_cita/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<UserEntity> call(UserEntity user, String contrasena) {
    return repository.register(user, contrasena);
  }
}