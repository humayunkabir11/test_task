import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../usecase/splash_usecase.dart';
import '../../../../core/common/models/success_response.dart';

abstract class SplashRepository {
  Future<Either<Failure, SuccessResponse?>> login(GetSplashParams params);
}
