import 'package:ai_weather/features/auth/domain/repositories/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupUseCase {
  final AuthRepo authRepo;

  SignupUseCase({required this.authRepo});

  Future<User?> call(
      {required String name,
      required String email,
      required String password}) async {
    return await authRepo.signup(name, email, password);
  }
}
