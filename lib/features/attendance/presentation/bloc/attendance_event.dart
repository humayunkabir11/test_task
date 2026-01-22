part of 'attendance_bloc.dart';

abstract class AttendanceEvent extends Equatable {
  const AttendanceEvent();
}

class FetchUser extends AttendanceEvent {
  final String userId;
  const FetchUser(this.userId);

  @override
  List<Object> get props => [userId];
}