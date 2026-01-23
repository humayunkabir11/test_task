
import '../../core/di/init_dependencies.dart';
import '../../core/network/api_client.dart';
import '../../core/network/connection_checker.dart';
import 'data/datasources/home_remote_data_source.dart';
import 'data/repositories/home_repository_impl.dart';
import 'domain/repositories/home_repository.dart';
import 'domain/usecase/get_home_data_usecase.dart';
import 'domain/usecase/get_products_usecase.dart';
import 'presentation/bloc/all_product_bloc.dart';
import 'presentation/bloc/home_bloc.dart';

class HomeInjector {
  /// Initialize Home feature dependencies
  static Future<void> init() async {
    // Data Source
    sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteSourceImpl(
        apiClient: sl<ApiClient>(),
      ),
    );

    // Repository
    sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(
        remoteSource: sl<HomeRemoteDataSource>(),
        connectionChecker: sl<ConnectionChecker>(),
      ),
    );

    // Use Cases
    sl.registerLazySingleton(
      () => GetHomeDataUseCase(sl<HomeRepository>()),
    );
    sl.registerLazySingleton(
      () => GetProductsUseCase(sl<HomeRepository>()),
    );

    // Blocs
    sl.registerFactory(() => HomeBloc(getHomeDataUseCase: sl<GetHomeDataUseCase>()));
    sl.registerFactory(() => AllProductBloc(getProductsUseCase: sl<GetProductsUseCase>()));
  }
}
