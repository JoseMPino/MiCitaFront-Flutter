part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String correo;
  final String contrasena;

  const LoginButtonPressed({
    required this.correo,
    required this.contrasena,
  });

  @override
  List<Object> get props => [correo, contrasena];
}