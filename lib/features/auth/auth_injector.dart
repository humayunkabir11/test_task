import '../../core/di/init_dependencies.dart';
import '../../core/network/api_client.dart';
import '../../core/network/connection_checker.dart';
import 'data/datasources/auth_remote_data_source.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecase/auth_usecase.dart';

import 'presentation/bloc/auth_bloc.dart';

class AuthInjector {
  /// Initialize Auth feature dependencies
  static Future<void> init() async {
    sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteSourceImpl(
        apiClient: sl<ApiClient>(), // Make sure ApiClient is already registered
      ),
    );

    sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteSource: sl<AuthRemoteDataSource>(),
        connectionChecker: sl<ConnectionChecker>(),
      ),
    );

    sl.registerLazySingleton(() => AuthUseCase(authRepository: sl()));
    sl.registerFactory(() => AuthBloc(authUseCase: sl()));
  }
}
