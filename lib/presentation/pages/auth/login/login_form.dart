import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_cita/presentation/blocs/auth/login/login_bloc.dart';
import 'package:mi_cita/core/utils/validators.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          // Navegar a home
          Navigator.pushReplacementNamed(context, '/home');
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16,top: 5, bottom: 0),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              children: [
                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logoApp.png',
                    height: 100,
                  ),
                  const SizedBox(width: 10),
                  Padding(
                    padding: EdgeInsets.only(top: 56),
                    child: const Text(
                      'MiCita',
                      style: TextStyle(
                        fontFamily: 'EtnaSans',
                        color: Color(0xFF154360),
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Correo'),
                  validator: (value) => Validators.validateEmail(value),
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Contraseña'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'La contraseña es obligatoria';
                    }
                    if (value.length < 4) {
                      return 'Mínimo 4 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return const CircularProgressIndicator();
                    }
                    return ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(
                            LoginButtonPressed(
                              correo: _emailController.text,
                              contrasena: _passwordController.text,
                            ),
                          );
                        }
                      },
                      child: const Text('Iniciar Sesión'),
                    );
                  },
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text('¿No tienes cuenta? Regístrate'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
