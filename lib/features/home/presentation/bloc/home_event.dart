part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchUser extends HomeEvent {
  final String userId;
  const FetchUser(this.userId);

  @override
  List<Object> get props => [userId];
}