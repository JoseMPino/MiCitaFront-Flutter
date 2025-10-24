class UserEntity {
  final String? id;
  final String nombres;
  final String apellidos;
  final String correo;
  final String telefono;
  final String? contrasena;
  final String rol;
  final bool estado;

  UserEntity({
    this.id,
    required this.nombres,
    required this.apellidos,
    required this.correo,
    required this.telefono,
    this.contrasena,
    required this.rol,
    required this.estado,
  });
}