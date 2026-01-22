import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/attendance_repository.dart';
import '../../data/models/attendance_response.dart';


class AttendanceUseCase implements UseCase<AttendanceResponse, GetAttendanceParams> {
  final AttendanceRepository? attendanceRepository;
  AttendanceUseCase({this.attendanceRepository});
  @override
  Future<Either<Failure, AttendanceResponse>> call(GetAttendanceParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }

}

class GetAttendanceParams{
  final String? path;
  final Map<String, dynamic>? query;
  final Map<String, dynamic>? body;

  GetAttendanceParams({
    this.path,
    this.query,
    this.body,
  });
}