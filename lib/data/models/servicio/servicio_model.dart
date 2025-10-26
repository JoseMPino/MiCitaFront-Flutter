class ServicioModel {
  final int id;
  final String nombre;
  final String descripcion;
  final double precio;
  final int duracionMinutos;
  final int negocioId;
  final int categoriaServicioId;
  final bool estado;
  final DateTime creadoEn;

  ServicioModel({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.duracionMinutos,
    required this.negocioId,
    required this.categoriaServicioId,
    required this.estado,
    required this.creadoEn,
  });

  factory ServicioModel.fromJson(Map<String, dynamic> json) {
    return ServicioModel(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      precio: json['precio'].toDouble(),
      duracionMinutos: json['duracionMinutos'],
      negocioId: json['negocioId'],
      categoriaServicioId: json['categoriaServicioId'],
      estado: json['estado'],
      creadoEn: DateTime.parse(json['creadoEn']),
    );
  }

  Map<String, dynamic> toJson() => {
        'nombre': nombre,
        'descripcion': descripcion,
        'precio': precio,
        'duracionMinutos': duracionMinutos,
        'negocioId': negocioId,
        'categoriaServicioId': categoriaServicioId,
        'estado': estado,
      };
}