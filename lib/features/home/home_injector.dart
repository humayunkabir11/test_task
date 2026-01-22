import '../../core/di/init_dependencies.dart';
import '../../core/network/api_client.dart';
import '../../core/network/connection_checker.dart';
import 'data/datasources/home_remote_data_source.dart';
import 'data/repositories/home_repository_impl.dart';
import 'domain/repositories/home_repository.dart';
import 'domain/usecase/home_usecase.dart';

import 'presentation/bloc/home_bloc.dart';

class HomeInjector {
  /// Initialize Home feature dependencies
  static Future<void> init() async {
    sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteSourceImpl(
        apiClient: sl<ApiClient>(), // Make sure ApiClient is already registered
      ),
    );

    sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(
        remoteSource: sl<HomeRemoteDataSource>(),
        connectionChecker: sl<ConnectionChecker>(),
      ),
    );

    sl.registerLazySingleton(
      () => HomeUseCase(homeRepository: sl<HomeRepository>()),
    );
    sl.registerFactory(() => HomeBloc(homeUseCase: sl<HomeUseCase>()));
  }
}
