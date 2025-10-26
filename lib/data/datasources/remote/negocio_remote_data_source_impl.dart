import 'package:dio/dio.dart';
import 'package:mi_cita/core/constants/app_constants.dart';
import 'package:mi_cita/core/errors/failures.dart';
import 'package:mi_cita/data/datasources/remote/negocio_remote_data_source.dart';
import 'package:mi_cita/data/models/negocio/negocio_model.dart';

class NegocioRemoteDataSourceImpl implements NegocioRemoteDataSource {
  final Dio dio;

  NegocioRemoteDataSourceImpl({required this.dio});

  @override
  Future<NegocioModel> crearNegocio(NegocioModel negocio) async {
    try {
      final response = await dio.post(AppConstants.baseUrl+AppConstants.negocioEndpoint, data: negocio.toJson());
      return NegocioModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(e.response?.data['message'] ?? 'Error al crear negocio');
    }
  }
}