import 'package:dio/dio.dart';
import 'package:mi_cita/core/constants/app_constants.dart';
import 'package:mi_cita/core/errors/failures.dart';
import 'package:mi_cita/data/datasources/remote/servicio_remote_data_source.dart';
import 'package:mi_cita/data/models/servicio/servicio_model.dart';

class ServicioRemoteDataSourceImpl  implements ServicioRemoteDataSource{
   final Dio dio;
   ServicioRemoteDataSourceImpl({required this.dio});

   @override
   Future<ServicioModel> crearServicio (ServicioModel servicio) async{
    try {
      final response = await dio.post(AppConstants.baseUrl+AppConstants.servicioEndpoint, data: servicio.toJson());
      return ServicioModel.fromJson(response.data);
    } on DioException  catch (e) {
      throw ServerException(e.response?.data['message'] ?? 'Error al crear servicio');
    }

   }

}