
import '../../../../core/error/server_exception.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/config/strings/api_endpoint.dart';
import '../../domain/usecase/attendance_usecase.dart';
import '../../../../core/common/models/success_response.dart';

abstract class AttendanceRemoteDataSource {
    Future<SuccessResponse?> login(GetAttendanceParams params);
}

class AttendanceRemoteSourceImpl implements AttendanceRemoteDataSource {
  final ApiClient apiClient;
  AttendanceRemoteSourceImpl({required this.apiClient});

  @override
  Future<SuccessResponse?> login(GetAttendanceParams params) async {
    // TODO: implement login
    try {
      final result = await apiClient.post(
          api: ApiEndpoint.login,
          body: params.body ?? {}
          );
      return SuccessResponse.fromJson(result.data);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}