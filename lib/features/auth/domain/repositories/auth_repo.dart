import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<User?> login(String email, String password);
  Future<User?> signup(String fullName,String email, String password);

}