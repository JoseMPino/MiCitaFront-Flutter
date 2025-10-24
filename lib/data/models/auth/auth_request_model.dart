class AuthRequestModel {
  final String correo;
  final String contrasena;

  AuthRequestModel({
    required this.correo,
    required this.contrasena,
  });

  Map<String, dynamic> toJson() => {
    'correo': correo,
    'contrasena': contrasena,
  };
}