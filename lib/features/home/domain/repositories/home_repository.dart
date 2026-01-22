import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../usecase/home_usecase.dart';
import '../../../../core/common/models/success_response.dart';

abstract class HomeRepository {
  Future<Either<Failure, SuccessResponse?>> login(GetHomeParams params);
}
