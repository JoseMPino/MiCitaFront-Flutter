import 'package:mi_cita/core/errors/failures.dart';
import 'package:mi_cita/data/datasources/local/local_storage_data_source.dart';
import 'package:mi_cita/data/datasources/remote/auth_remote_data_source.dart';
import 'package:mi_cita/data/models/auth/auth_request_model.dart';
import 'package:mi_cita/data/models/user/user_model.dart';
import 'package:mi_cita/domain/entities/auth_entity.dart';
import 'package:mi_cita/domain/entities/user_entity.dart';
import 'package:mi_cita/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final LocalStorageDataSource localStorage;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localStorage,
  });

  @override
  Future<AuthEntity> login(String correo, String contrasena) async {
    try {
      final authRequest = AuthRequestModel(
        correo: correo,
        contrasena: contrasena,
      );
      
      final authResponse = await remoteDataSource.login(authRequest);
      
      // Guardar token y datos de usuario localmente
      await localStorage.saveToken(authResponse.token);
      await localStorage.saveUserData(authResponse.correo, authResponse.rol);
      
      return AuthEntity(
        token: authResponse.token,
        correo: authResponse.correo,
        rol: authResponse.rol,
      );
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    }
  }

  @override
  Future<UserEntity> register(UserEntity user, String contrasena) async {
    try {
      final userModel = UserModel(
        nombres: user.nombres,
        apellidos: user.apellidos,
        correo: user.correo,
        telefono: user.telefono,
        rol: user.rol,
        estado: user.estado,
        contrasena: contrasena, 
        negocioId: null,        
      );
      
      final registeredUser = await remoteDataSource.register(userModel);
      
      return UserEntity(
        id: registeredUser.id,
        nombres: registeredUser.nombres,
        apellidos: registeredUser.apellidos,
        correo: registeredUser.correo,
        telefono: registeredUser.telefono,
        rol: registeredUser.rol,
        estado: registeredUser.estado,
      );
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    final token = await localStorage.getToken();
    return token != null;
  }

  @override
  Future<void> logout() async {
    await localStorage.clearAll();
  }

  @override
  Future<String?> getToken() {
    return localStorage.getToken();
  }
}