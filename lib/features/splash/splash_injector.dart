import '../../core/di/init_dependencies.dart';
import '../../core/network/api_client.dart';
import '../../core/network/connection_checker.dart';
import 'data/datasources/splash_remote_data_source.dart';
import 'data/repositories/splash_repository_impl.dart';
import 'domain/repositories/splash_repository.dart';
import 'domain/usecase/splash_usecase.dart';

import 'presentation/bloc/splash_bloc.dart';

class SplashInjector {
  /// Initialize Splash feature dependencies
  static Future<void> init() async {
    sl.registerLazySingleton<SplashRemoteDataSource>(
      () => SplashRemoteSourceImpl(
        apiClient: sl<ApiClient>(), // Make sure ApiClient is already registered
      ),
    );

    sl.registerLazySingleton<SplashRepository>(
      () => SplashRepositoryImpl(
        remoteSource: sl<SplashRemoteDataSource>(),
        connectionChecker: sl<ConnectionChecker>(),
      ),
    );

    sl.registerLazySingleton(
      () => SplashUseCase(splashRepository: sl<SplashRepository>()),
    );
    sl.registerFactory(() => SplashBloc(splashUseCase: sl<SplashUseCase>()));
  }
}
