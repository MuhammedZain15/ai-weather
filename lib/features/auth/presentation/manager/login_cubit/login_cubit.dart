import 'package:ai_weather/features/auth/domain/use_cases/login_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(LoginInitialState());

  Future<void> login(String email, String password) async {
    try {
      emit(LoginLoadingState());
      final user = await loginUseCase.call(email, password);
      emit(LoginSuccessState(user!));
    } catch (e) {
      emit(LoginFailureState(e.toString()));
    }
  }
}
