import 'package:dio/dio.dart';
import 'package:mi_cita/core/constants/app_constants.dart';
import 'package:mi_cita/core/errors/failures.dart';
import 'package:mi_cita/data/datasources/remote/auth_remote_data_source.dart';
import 'package:mi_cita/data/models/auth/auth_request_model.dart';
import 'package:mi_cita/data/models/auth/auth_response_model.dart';
import 'package:mi_cita/data/models/user/user_model.dart';


class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<AuthResponseModel> login(AuthRequestModel authRequest) async {
    try {
      final response = await dio.post(
        (AppConstants.baseUrl+AppConstants.loginEndpoint),
        data: authRequest.toJson(),
      );
      return AuthResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(e.response?.data['message'] ?? 'Error de conexión');
    }
  }

  @override
  Future<UserModel> register(UserModel user) async {
    try {
      final response = await dio.post(
        (AppConstants.baseUrl+AppConstants.registerEndpoint),
        data: user.toJson(),
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(e.response?.data['message'] ?? 'Error de registro');
    }
  }
}