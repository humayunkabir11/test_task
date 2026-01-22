
import '../../../../core/error/server_exception.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/config/strings/api_endpoint.dart';
import '../../domain/usecase/splash_usecase.dart';
import '../../../../core/common/models/success_response.dart';

abstract class SplashRemoteDataSource {
    Future<SuccessResponse?> login(GetSplashParams params);
}

class SplashRemoteSourceImpl implements SplashRemoteDataSource {
  final ApiClient apiClient;
  SplashRemoteSourceImpl({required this.apiClient});

  @override
  Future<SuccessResponse?> login(GetSplashParams params) async {
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