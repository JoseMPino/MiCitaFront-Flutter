class NegocioModel {
    final int id;
  final String nombre;
  final String direccion;
  final String telefono;
  final int administradorId;
  final int categoriaNegocioId;
  final DateTime creadoEn;

  NegocioModel({
    required this.id,
    required this.nombre,
    required this.direccion,
    required this.telefono,
    required this.administradorId,
    required this.categoriaNegocioId,
    required this.creadoEn,
  });

  factory NegocioModel.fromJson(Map<String, dynamic> json) {
    return NegocioModel(
      id: json['id'],
      nombre: json['nombre'],
      direccion: json['direccion'],
      telefono: json['telefono'],
      administradorId: json['administradorId'],
      categoriaNegocioId: json['categoriaNegocioId'],
      creadoEn: DateTime.parse(json['creadoEn']),
    );
  }

  Map<String, dynamic> toJson() => {
        'nombre': nombre,
        'direccion': direccion,
        'telefono': telefono,
        'categoriaNegocioId': categoriaNegocioId,
      };

}