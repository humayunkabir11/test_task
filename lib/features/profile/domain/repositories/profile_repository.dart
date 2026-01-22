import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../usecase/profile_usecase.dart';
import '../../../../core/common/models/success_response.dart';

abstract class ProfileRepository {
  Future<Either<Failure, SuccessResponse?>> login(GetProfileParams params);
}
