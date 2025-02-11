part of 'login_cubit.dart';

abstract class LoginState {}

final class LoginInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final User user;

  LoginSuccessState(this.user);
}

final class LoginFailureState extends LoginState {
  final String message;

  LoginFailureState(this.message);
}
