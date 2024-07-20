import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ya9in/root_app.dart';
import 'package:ya9in/screens/otp_screen.dart';
import 'package:ya9in/screens/sign_up_screen.dart';

class PhoneVerification extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Check if the user's phone number is verified
  bool isPhoneVerified() {
    User? user = _firebaseAuth.currentUser;
    return user?.phoneNumber != null;
  }

  // Proceed to homescreen or prompt for phone verification
  void proceedToHomeScreen(BuildContext context) {
    if (isPhoneVerified()) {
      // Navigate to the home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => RootApp(),
        ),
      );
    } else {
      // Prompt for phone verification
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              SignUpScreen(), // Create a screen for phone number input
        ),
      );
    }
  }

  // Send the OTP code for sign up
  void continueWithPhone(BuildContext context, String phoneNumber) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          // Automatically sign in the user upon verification completion
          await _firebaseAuth.signInWithCredential(phoneAuthCredential);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RootApp(),
            ),
          ); // Navigate to home screen upon successful verification
        },
        verificationFailed: (error) {
          throw Exception(error.message);
        },
        codeSent: (verificationId, forceResendingToken) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(verificationId: verificationId),
            ),
          );
        },
        codeAutoRetrievalTimeout: (verificationId) {
          // Handle code auto retrieval timeout
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text('The SMS code has expired. Please request a new code.'),
          ));
        },
      );

      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
      ));
      _isLoading = false;
      notifyListeners();
    }
  }

  // Login the user with a verified phone number
  void loginWithPhone(BuildContext context, String phoneNumber) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          // Automatically sign in the user upon verification completion
          await _firebaseAuth.signInWithCredential(phoneAuthCredential);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RootApp(),
            ),
          ); // Navigate to home screen upon successful verification
        },
        verificationFailed: (error) {
          throw Exception(error.message);
        },
        codeSent: (verificationId, forceResendingToken) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(verificationId: verificationId),
            ),
          );
        },
        codeAutoRetrievalTimeout: (verificationId) {
          // Handle code auto retrieval timeout
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text('The SMS code has expired. Please request a new code.'),
          ));
        },
      );

      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
      ));
      _isLoading = false;
      notifyListeners();
    }
  }

  // Verify OTP code
  void verifyOtp({
    required BuildContext context,
    required String verificationId,
    required String userOtp,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOtp,
      );

      // Sign in the user with the phone credentials
      await _firebaseAuth.signInWithCredential(creds);

      _isLoading = false;
      notifyListeners();

      // Call the onSuccess callback
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'session-expired') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('The SMS code has expired. Please request a new code.'),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message.toString()),
        ));
      }

      _isLoading = false;
      notifyListeners();
    }
  }
}
