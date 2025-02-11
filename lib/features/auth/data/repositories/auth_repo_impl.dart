import 'package:ai_weather/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:ai_weather/features/auth/domain/repositories/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl(this.authRemoteDataSource);

  @override
  Future<User?> login(String email, String password) {
    return authRemoteDataSource.login(email, password);
  }

  @override
  Future<User?> signup(String fullName, String email, String password) {
    return authRemoteDataSource.signup(fullName, email, password);
  }
}
