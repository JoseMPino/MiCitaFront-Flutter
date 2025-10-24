class AuthEntity {
  final String token;
  final String correo;
  final String rol;

  AuthEntity({
    required this.token,
    required this.correo,
    required this.rol,
  });
}