import 'package:mi_cita/data/models/categoria/categoria_negocio_model.dart';
import 'package:mi_cita/data/models/categoria/categoria_servicio_model.dart';
 abstract class CategoriaRemoteDataSource {
  Future<List<CategoriaNegocioModel>> getCategoriasNegocio();
  Future<List<CategoriaServicioModel>> getCategoriasServicio(int categoriaNegocioId);
 }