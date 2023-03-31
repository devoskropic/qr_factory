// ignore_for_file: unused_field

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qr_factory/data/models/user.dart';

part 'exceptions.dart';

/// Repository which manages user authentication.
class AuthRepository {
  final auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthRepository({
    auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  // stream user -> actual usuario cuando el estado de auth cambia
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null ? User.empty : firebaseUser.toUser;
    });
  }

  // Register user w / email & pass
  Future<void> signUp({required String email, required String pass}) async {
    // assert(email != null && pass != null);
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
    } on Exception {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }
  // Google login

  // email & pass login

  // close session
}

extension on auth.User {
  User get toUser {
    return User(
      id: uid,
      email: email,
      name: displayName,
      photo: photoURL,
    );
  }
}
