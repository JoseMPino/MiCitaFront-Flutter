import 'package:flutter/material.dart';
import 'package:mi_cita/injection_container.dart';
import 'package:mi_cita/presentation/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MiCita',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: '/',
    );
  }
}
