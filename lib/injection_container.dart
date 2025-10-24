import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mi_cita/data/datasources/local/local_storage_data_source.dart';
import 'package:mi_cita/data/datasources/remote/auth_remote_data_source.dart';
import 'package:mi_cita/data/datasources/remote/auth_remote_data_source_impl.dart';
import 'package:mi_cita/data/repositories/auth_repository_impl.dart';
import 'package:mi_cita/domain/repositories/auth_repository.dart';
import 'package:mi_cita/domain/usecases/login_usecase.dart';
import 'package:mi_cita/domain/usecases/register_usecase.dart';
import 'package:mi_cita/presentation/blocs/auth/login/login_bloc.dart';
import 'package:mi_cita/presentation/blocs/auth/register/register_bloc.dart';
import 'package:mi_cita/data/datasources/local/local_storage_data_source_impl.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Blocs
  getIt.registerFactory(() => LoginBloc(loginUseCase: getIt()));
  getIt.registerFactory(() => RegisterBloc(registerUseCase: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton(() => RegisterUseCase(getIt()));

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: getIt(), localStorage: getIt()),
  );

  // Data sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(dio: getIt()),
  );

  getIt.registerLazySingleton<LocalStorageDataSource>(
    () => LocalStorageDataSourceImpl(),
  );

  // External
  getIt.registerLazySingleton(() => Dio());
}
