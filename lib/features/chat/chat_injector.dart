import '../../core/di/init_dependencies.dart';
import '../../core/network/api_client.dart';
import '../../core/network/connection_checker.dart';
import 'data/datasources/chat_remote_data_source.dart';
import 'data/repositories/chat_repository_impl.dart';
import 'domain/repositories/chat_repository.dart';
import 'domain/usecase/chat_usecase.dart';

import 'presentation/bloc/chat_bloc.dart';

class ChatInjector {
  /// Initialize Chat feature dependencies
  static Future<void> init() async {
    sl.registerLazySingleton<ChatRemoteDataSource>(
      () => ChatRemoteSourceImpl(
        apiClient: sl<ApiClient>(), // Make sure ApiClient is already registered
      ),
    );

    sl.registerLazySingleton<ChatRepository>(
      () => ChatRepositoryImpl(
        remoteSource: sl<ChatRemoteDataSource>(),
        connectionChecker: sl<ConnectionChecker>(),
      ),
    );

    sl.registerLazySingleton(
      () => ChatUseCase(chatRepository: sl<ChatRepository>()),
    );
    sl.registerFactory(() => ChatBloc(chatUseCase: sl<ChatUseCase>()));
  }
}
