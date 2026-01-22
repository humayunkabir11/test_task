import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/splash_repository.dart';
import '../../data/models/splash_response.dart';


class SplashUseCase implements UseCase<SplashResponse, GetSplashParams> {
  final SplashRepository? splashRepository;
  SplashUseCase({this.splashRepository});
  @override
  Future<Either<Failure, SplashResponse>> call(GetSplashParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }

}

class GetSplashParams{
  final String? path;
  final Map<String, dynamic>? query;
  final Map<String, dynamic>? body;

  GetSplashParams({
    this.path,
    this.query,
    this.body,
  });
}