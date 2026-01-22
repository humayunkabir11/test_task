part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class FetchUser extends AuthEvent {
  final String userId;
  const FetchUser(this.userId);

  @override
  List<Object> get props => [userId];
}

class LoginEvent extends AuthEvent {
  final GetAuthParams params;

  const LoginEvent({required this.params});

  @override
  // TODO: implement props
  List<Object?> get props => [params];
}

class SelectRoleEvent extends AuthEvent {
  final UserRole role;
  const SelectRoleEvent(this.role);

  @override
  List<Object> get props => [role];
}
