part of 'attendance_bloc.dart';

abstract class AttendanceState extends Equatable {
  const AttendanceState();
}

class AttendanceInitial extends AttendanceState {
  @override
  List<Object> get props => [];
}

// class UserLoading extends UserState {
//   @override
//   List<Object> get props => [];
// }

// class UserLoaded extends UserState {
//   final User user;
//   const UserLoaded(this.user);

//   @override
//   List<Object> get props => [user];
// }

// class UserError extends UserState {
//   final String message;
//   const UserError(this.message);

//   @override
//   List<Object> get props => [message];
// }