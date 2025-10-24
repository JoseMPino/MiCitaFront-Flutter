part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterButtonPressed extends RegisterEvent {
  final UserEntity user;
  final String contrasena;

  const RegisterButtonPressed({
    required this.user,
    required this.contrasena,
  });

  @override
  List<Object> get props => [user, contrasena];
}