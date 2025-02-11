part of 'signup_cubit.dart';

abstract class SignupState {}

final class SignupInitialState extends SignupState {}

final class SignupLoadingState extends SignupState {}

final class SignupSuccessState extends SignupState {
  final User user;

  SignupSuccessState(this.user);
}

final class SignupIFailureState extends SignupState {
  final String message;

  SignupIFailureState(this.message);
}
