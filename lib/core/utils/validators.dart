class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'El correo es obligatorio';
    if (!value.contains('@')) return 'Correo inválido';
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'La contraseña es obligatoria';
    if (value.length < 4) return 'Debe tener al menos 4 caracteres';
    return null;
  }

  static String? validateText(String? value, String campo) {
    if (value == null || value.isEmpty) return '$campo es obligatorio';
    return null;
  }
}