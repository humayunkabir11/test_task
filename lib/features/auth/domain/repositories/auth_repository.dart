import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/api_response.dart';
import '../../data/models/auth_data.dart';
import '../usecase/auth_usecase.dart';
import '../../../../core/common/models/success_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, ApiResponse<AuthData>>> login(GetAuthParams params);
}
