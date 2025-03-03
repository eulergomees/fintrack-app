// Firebase imports:
import "package:firebase_auth/firebase_auth.dart";

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> signUpUser({required String name,
    required String email,
    required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user!.updateDisplayName(name);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return 'Email already in use';
      }
      if (e.code == "invalid-email") {
        return 'Invalid email';
      }
      return e.code;
    }
  }

  Future<String?> loginUser({required email, required password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void>  logout() async {
    return _firebaseAuth.signOut();
  }
}