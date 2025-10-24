import 'package:mi_cita/data/models/auth/auth_request_model.dart';
import 'package:mi_cita/data/models/auth/auth_response_model.dart';
import 'package:mi_cita/data/models/user/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login(AuthRequestModel authRequest);
  Future<UserModel> register(UserModel user);
}


