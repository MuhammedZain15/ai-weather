import 'package:ai_weather/features/auth/domain/use_cases/signup_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupUseCase signupUseCase;

  SignupCubit({required this.signupUseCase}) : super(SignupInitialState());

  Future<void> signup(String name, String email, String password) async {
    try {
      emit(SignupLoadingState());
      final user = await signupUseCase.call(
          name: name, email: email, password: password);
      emit(SignupSuccessState(user!));
    } catch (e) {
      emit(SignupIFailureState(e.toString()));
    }
  }
}
