part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginSuccessState extends AuthState {
  final AuthData? authData;

  const LoginSuccessState({this.authData});

  @override
  // TODO: implement props
  List<Object?> get props => [authData];
}

class LoginErrorState extends AuthState {
  final String? message;

  const LoginErrorState({this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class AuthRoleSelected extends AuthState {
  final UserRole role;
  const AuthRoleSelected(this.role);

  @override
  List<Object> get props => [role];
}
