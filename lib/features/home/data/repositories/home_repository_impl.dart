import 'package:fpdart/src/either.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/server_exception.dart';
import '../../../../core/network/connection_checker.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/usecase/home_usecase.dart';
import '../datasources/home_remote_data_source.dart';
import '../../../../core/common/models/success_response.dart';


class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteSource;
  final ConnectionChecker connectionChecker;

  HomeRepositoryImpl(
      {required this.remoteSource, required this.connectionChecker});

  @override
  Future<Either<Failure, SuccessResponse?>> login(GetHomeParams params) async {
    // TODO: implement login
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure(message: "no internet connection!!"));
      } else {
        final data = await remoteSource.login(params);
        if (data?.success == false) {
          return left(
            Failure(
              message: data?.message ?? "Failed to login",
              statusCode: 0,
              constrain: data?.data?.code ?? "",
            )
          );
        } else {
          return right(data);
        }
      }
    } on ServerException catch (e) {
      return left(Failure(message:e.message));
    } catch (e) {
      return left(Failure(message: "Something went wrong"));
    }
  }
  
  
}
