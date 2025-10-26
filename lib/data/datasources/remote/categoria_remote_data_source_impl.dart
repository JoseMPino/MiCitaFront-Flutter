import 'package:dio/dio.dart';
import 'package:mi_cita/core/constants/app_constants.dart';
import 'package:mi_cita/core/errors/failures.dart';
import 'package:mi_cita/data/datasources/remote/categoria_remote_data_source.dart';
import 'package:mi_cita/data/models/categoria/categoria_negocio_model.dart';
import 'package:mi_cita/data/models/categoria/categoria_servicio_model.dart';

class CategoriaRemoteDataSourceImpl implements CategoriaRemoteDataSource {
  final Dio dio;

  CategoriaRemoteDataSourceImpl({required this.dio});
  @override
  Future<List<CategoriaNegocioModel>> getCategoriasNegocio() async {
    try {
      final response = await dio.get(AppConstants.baseUrl+AppConstants.categoriasNegocioEndpoint);
      return (response.data as List)
          .map((json) => CategoriaNegocioModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw ServerException(e.response?.data['message'] ?? 'Error al obtener categorías');
    }
  }

  @override
  Future<List<CategoriaServicioModel>> getCategoriasServicio(int categoriaNegocioId) async {
    try {
      final response = await dio.get(AppConstants.baseUrl+AppConstants.categoriasServicioEndpoint+categoriaNegocioId.toString());
      return (response.data as List)
          .map((json) => CategoriaServicioModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw ServerException(e.response?.data['message'] ?? 'Error al obtener subcategorías');
    }
  }

}