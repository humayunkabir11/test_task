import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecase/attendance_usecase.dart';

part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final AttendanceUseCase attendanceUseCase;
  AttendanceBloc({required this.attendanceUseCase}) : super(AttendanceInitial());

  Stream<AttendanceState> mapEventToState(AttendanceEvent event) async* {
    // if (event is FetchUser) {
    //   yield UserLoading();
    //   try {
    //     final user = await getUserUseCase(event.userId);
    //     yield UserLoaded(user);
    //   } catch (e) {
    //     yield UserError(e.toString());
    //   }
    // }
  }
}