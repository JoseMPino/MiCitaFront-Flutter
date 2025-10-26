class CategoriaNegocioModel {
  final int id;
  final String nombre;
  final String descripcion;
  final DateTime creadoEn;

  CategoriaNegocioModel({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.creadoEn,
  });

factory CategoriaNegocioModel.fromJson(Map<String, dynamic>json){
  return CategoriaNegocioModel(
    id: json['id'],
    nombre: json['nombre'],
    descripcion: json['descripcion'],
    creadoEn: DateTime.parse(json['creadoEn']),
  );
}

Map<String, dynamic> toJson() =>{
  'id':id,
  'nombre':nombre,
  'descripcion':descripcion,
  'creadoEn':creadoEn.toIso8601String(),
};



}