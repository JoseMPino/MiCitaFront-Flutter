import 'package:mi_cita/data/models/negocio/negocio_model.dart';

abstract class NegocioRemoteDataSource {
  Future<NegocioModel> crearNegocio(NegocioModel negocio);
}