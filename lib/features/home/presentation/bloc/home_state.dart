part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
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