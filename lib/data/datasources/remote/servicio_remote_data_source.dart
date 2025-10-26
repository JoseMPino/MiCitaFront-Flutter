import 'package:mi_cita/data/models/servicio/servicio_model.dart';

abstract class ServicioRemoteDataSource {
  Future<ServicioModel> crearServicio (ServicioModel servicio);
}