import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';
import '../../data/models/auth_data.dart';

class AuthUseCase implements UseCase<AuthData, GetAuthParams> {
  final AuthRepository? authRepository;
  AuthUseCase({this.authRepository});
  @override
  Future<Either<Failure, AuthData>> call(GetAuthParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }

  Future<Either<Failure, ApiResponse<AuthData>>> login(GetAuthParams params) {
    // TODO: implement call
    return authRepository!.login(params);
  }
}

class GetAuthParams {
  final String? path;
  final Map<String, dynamic>? query;
  final Map<String, dynamic>? body;

  GetAuthParams({this.path, this.query, this.body});
}
