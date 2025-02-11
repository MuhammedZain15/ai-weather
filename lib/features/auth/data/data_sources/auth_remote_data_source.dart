import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/firebase_utils/firebase_utils.dart';

abstract class AuthRemoteDataSource {
  Future<User?> login(String email, String password);
  Future<User?> signup(String fullName, String email, String password);

}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuthService firebaseAuthService;

  AuthRemoteDataSourceImpl(this.firebaseAuthService);

  @override
  Future<User?> login(String email, String password) {
    return firebaseAuthService.signIn(email, password);
  }

  @override
  Future<User?> signup(String fullName, String email, String password) {
    return firebaseAuthService.signUp(email, password, fullName);
  }
}
