part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();
}

class FetchUser extends SplashEvent {
  final String userId;
  const FetchUser(this.userId);

  @override
  List<Object> get props => [userId];
}