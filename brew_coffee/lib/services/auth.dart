import 'package:brew_coffee/models/user.dart';
import 'package:brew_coffee/services/database.dart';
import 'package:brew_coffee/services/locator.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:flutter/cupertino.dart' as cupertino;

class AuthService {
  final firebaseAuth.FirebaseAuth _firebaseAuth =
      firebaseAuth.FirebaseAuth.instance;

  User? _userFromFirebase(firebaseAuth.User? user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future loginWithEmail(String email, String password) async {
    try {
      firebaseAuth.UserCredential result =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return _userFromFirebase(result.user);
    } catch (e) {
      cupertino.debugPrint(e.toString());
      return null;
    }
  }

  Future registerWithEmail(String name, String email, String password) async {
    try {
      firebaseAuth.UserCredential result =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = _userFromFirebase(result.user);
      await locator<DatabaseService>().updateUserData(
        user!.uid,
        name,
        0,
        100,
      );

      return user;
    } catch (e) {
      cupertino.debugPrint(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      cupertino.debugPrint(e.toString());
      return null;
    }
  }
}
