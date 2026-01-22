import '../../core/di/init_dependencies.dart';
import '../../core/network/api_client.dart';
import '../../core/network/connection_checker.dart';
import 'data/datasources/attendance_remote_data_source.dart';
import 'data/repositories/attendance_repository_impl.dart';
import 'domain/repositories/attendance_repository.dart';
import 'domain/usecase/attendance_usecase.dart';

import 'presentation/bloc/attendance_bloc.dart';

class AttendanceInjector {
  /// Initialize Attendance feature dependencies
  static Future<void> init() async {
    sl.registerLazySingleton<AttendanceRemoteDataSource>(
      () => AttendanceRemoteSourceImpl(
        apiClient: sl<ApiClient>(), // Make sure ApiClient is already registered
      ),
    );

    sl.registerLazySingleton<AttendanceRepository>(
      () => AttendanceRepositoryImpl(
        remoteSource: sl<AttendanceRemoteDataSource>(),
        connectionChecker: sl<ConnectionChecker>(),
      ),
    );

    sl.registerLazySingleton(
      () => AttendanceUseCase(attendanceRepository: sl<AttendanceRepository>()),
    );
    sl.registerFactory(
      () => AttendanceBloc(attendanceUseCase: sl<AttendanceUseCase>()),
    );
  }
}
