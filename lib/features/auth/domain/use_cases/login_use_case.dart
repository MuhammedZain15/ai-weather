import 'package:ai_weather/features/auth/domain/repositories/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginUseCase {
  final AuthRepo authRepo;

  LoginUseCase({required this.authRepo});

  Future<User?> call(String email, String password) async {
    return authRepo.login(email, password);
  }
}
