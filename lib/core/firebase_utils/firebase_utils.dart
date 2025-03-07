import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/domain/entities/user_data.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signUp(String email, String password, String fullName) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        UserData userData = UserData(
          uid: user.uid,
          email: user.email!,
          fullName: fullName,
        );

        await _firestore
            .collection(UserData.collectionName)
            .doc(user.uid)
            .set(userData.toJson());

        // حفظ الـ userId في SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userId', user.uid);
      }
      return user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userId', userCredential.user!.uid);

      return userCredential.user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
