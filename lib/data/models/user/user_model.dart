class UserModel {
  final String? id;
  final String nombres;
  final String apellidos;
  final String correo;
  final String telefono;
  final String rol;
  final bool estado;
  final String contrasena; 
  final int? negocioId;  

  UserModel({
    this.id,
    required this.nombres,
    required this.apellidos,
    required this.correo,
    required this.telefono,
    required this.rol,
    required this.estado,
    required this.contrasena,
    this.negocioId,
  });

  Map<String, dynamic> toJson() => {
    'nombres': nombres,
    'apellidos': apellidos,
    'correo': correo,
    'telefono': telefono,
    'rol': rol,
    'estado': estado,
    'contrasena': contrasena, 
    'negocioId': negocioId,  
  };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString(),
      nombres: json['nombres'],
      apellidos: json['apellidos'],
      correo: json['correo'],
      telefono: json['telefono'],
      rol: json['rol'],
      estado: json['estado'],
      contrasena: json['contrasena'] ?? '',
      negocioId: json['negocioId'],
    );
  }
}