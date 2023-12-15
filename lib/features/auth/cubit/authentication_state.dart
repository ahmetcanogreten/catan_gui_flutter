part of 'authentication_cubit.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class NotLoggedIn extends AuthenticationState {}

final class WaitRegistering extends AuthenticationState {}

final class WaitLoggingIn extends AuthenticationState {}

final class LoggedIn extends AuthenticationState {
  final User user;

  const LoggedIn({required this.user});

  @override
  List<Object> get props => [user];
}

final class LoginError extends AuthenticationState {}

final class RegisterError extends AuthenticationState {}
