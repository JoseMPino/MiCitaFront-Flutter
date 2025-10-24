import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_cita/injection_container.dart';
import 'package:mi_cita/presentation/blocs/auth/login/login_bloc.dart';
import 'package:mi_cita/presentation/pages/auth/login/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar Sesión')),
      body: BlocProvider(
        create: (context) => getIt<LoginBloc>(),
        child: const LoginForm(),
      ),
    );
  }
}
