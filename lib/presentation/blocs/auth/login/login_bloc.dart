import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mi_cita/domain/usecases/login_usecase.dart';
import 'package:mi_cita/core/errors/failures.dart';
import 'package:mi_cita/domain/entities/auth_entity.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final authEntity = await loginUseCase(
        event.correo,
        event.contrasena,
      );
      emit(LoginSuccess(authEntity));
    } on Failure catch (e) {
      emit(LoginFailure(e.message));
    }
  }
}