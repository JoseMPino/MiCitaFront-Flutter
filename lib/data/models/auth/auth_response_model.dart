class AuthResponseModel {
  final String token;
  final String correo;
  final String rol;

  AuthResponseModel({
    required this.token,
    required this.correo,
    required this.rol,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      token: json['token'],
      correo: json['correo'],
      rol: json['rol'],
    );
  }
}