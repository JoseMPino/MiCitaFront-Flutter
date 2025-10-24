import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_cita/injection_container.dart';
import 'package:mi_cita/presentation/blocs/auth/register/register_bloc.dart';
import 'package:mi_cita/presentation/pages/auth/register/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocProvider(
        create: (context) => getIt<RegisterBloc>(),
        child: const RegisterForm(),
      ),
    );
  }
}
