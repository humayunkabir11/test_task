import 'package:fpdart/src/either.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/server_exception.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/connection_checker.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecase/auth_usecase.dart';
import '../datasources/auth_remote_data_source.dart';
import '../../../../core/common/models/success_response.dart';
import '../models/auth_data.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteSource;
  final ConnectionChecker connectionChecker;

  AuthRepositoryImpl({
    required this.remoteSource,
    required this.connectionChecker,
  });

  @override
  Future<Either<Failure, ApiResponse<AuthData>>> login(
    GetAuthParams params,
  ) async {
    // TODO: implement login
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure(message: "no internet connection!!"));
      } else {
        final data = await remoteSource.login(params);
        if (data.status == false) {
          return left(Failure(message: data.message ?? "Failed to login"));
        } else {
          return right(data);
        }
      }
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: "Something went wrong"));
    }
  }
}
