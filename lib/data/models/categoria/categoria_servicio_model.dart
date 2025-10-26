class CategoriaServicioModel {
  final int id;
  final String nombre;
  final String descripcion;
  final int categoriaNegocioId;
  final DateTime creadoEn;

  CategoriaServicioModel({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.categoriaNegocioId,
    required this.creadoEn,
  });

   factory CategoriaServicioModel.fromJson(Map<String,dynamic> json){
    return CategoriaServicioModel(id: json['id'],
     nombre: json['nombre'],
     descripcion: json['descripcion'],
      categoriaNegocioId: json['categoriaNegocioId'],
       creadoEn: json['creadoEn']
       );
   }

     Map<String, dynamic> toJson() => {
        'id': id,
        'nombre': nombre,
        'descripcion': descripcion,
        'categoriaNegocioId': categoriaNegocioId,
        'creadoEn': creadoEn.toIso8601String(),
      };

}
