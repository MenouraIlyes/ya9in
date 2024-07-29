import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:ya9in/providers/user_provider.dart';

class AuthService {
  // Google sing in
  Future<User?> signInWithGoogle() async {
    try {
      // Begin interactive sign in process
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      if (gUser == null) {
        // The user canceled the sign-in
        return null;
      }

      // Obtain auth details from request
      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      // Create a new credential for user
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // Finally, sign in
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print('Error during the google sign in :${e.toString()}');
      return null;
    }
  }

  // Email sign in
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<User?> registerWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        // Handle email already in use error (display message, etc.)
        print('The email address is already in use by another account.');
        throw EmailAlreadyInUseException();
      } else {
        // Handle other FirebaseAuthException codes (optional)
        print('FirebaseAuthException: ${e.code}');
        return null;
      }
    } catch (e) {
      // Handle other exceptions that might occur
      print('An error occurred: ${e.toString()}');
      return null;
    }
  }

  // Sign out method
  Future<void> signOut(BuildContext context) async {
    try {
      // Sign out from Firebase
      await FirebaseAuth.instance.signOut();

      // Sign out from Google
      await GoogleSignIn().signOut();

      // Clear user data
      Provider.of<UserProvider>(context, listen: false).clearUser();
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}

// custom exception class
class EmailAlreadyInUseException implements Exception {}
