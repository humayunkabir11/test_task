

import '../../../../core/error/server_exception.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/config/strings/api_endpoint.dart';
import '../../../../core/network/api_response.dart';
import '../../domain/usecase/auth_usecase.dart';
import '../models/auth_data.dart';

abstract class AuthRemoteDataSource {
  Future<ApiResponse<AuthData>> login(GetAuthParams params);
}

class AuthRemoteSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;
  AuthRemoteSourceImpl({required this.apiClient});

  @override
  Future<ApiResponse<AuthData>> login(GetAuthParams params) async {
    // TODO: implement login
    try {
      final result = await apiClient.post(
        api: ApiEndpoint.login,
        body: params.body ?? {},
      );

      if (result.data == null) {
        throw ServerException("Server not response!");
      }

      return ApiResponse.fromJson(
        result.data,
        (data) => AuthData.fromJson(data),
      );
    } catch (e) {
      throw ServerException("Something went wrong");
    }
  }
}
