
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mi_cita/core/errors/failures.dart';
import 'package:mi_cita/domain/usecases/register_usecase.dart';
import 'package:mi_cita/domain/entities/user_entity.dart';

part 'register_event.dart';
part 'register_state.dart';


class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterBloc({required this.registerUseCase}) : super(RegisterInitial()) {
    on<RegisterButtonPressed>(_onRegisterButtonPressed);
  }

  Future<void> _onRegisterButtonPressed(
    RegisterButtonPressed event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());
    try {
      final userEntity = await registerUseCase(
        event.user,
        event.contrasena,
      );
      emit(RegisterSuccess(userEntity));
    } on Failure catch (e) {
      emit(RegisterFailure(e.message));
    }
  }
}