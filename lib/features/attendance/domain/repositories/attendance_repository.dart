import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../usecase/attendance_usecase.dart';
import '../../../../core/common/models/success_response.dart';

abstract class AttendanceRepository {
  Future<Either<Failure, SuccessResponse?>> login(GetAttendanceParams params);
}
