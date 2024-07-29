import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ya9in/models/user_info.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  // Add user
  Future<void> addUser(UserModel user) async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      DocumentReference userDocRef =
          FirebaseFirestore.instance.collection('users').doc(currentUser.uid);

      DocumentSnapshot userDoc = await userDocRef.get();

      if (!userDoc.exists) {
        // If the document does not exist, create it
        await userDocRef.set(user.toMap());
        _user = user;
        notifyListeners();
      } else {
        // If the document already exists, update it
        await updateUser(user);
      }
    }
  }

  // Fetch user
  Future<void> fetchUser() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    print("Fetching user data for: ${currentUser?.uid}");

    if (currentUser != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();
      if (userDoc.exists) {
        _user = UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
        notifyListeners();
      }
    }
  }

  // update user
  Future<void> updateUser(UserModel user) async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .set(user.toMap());
      _user = user;
      notifyListeners();
    }
  }

  // Clear user data
  void clearUser() {
    _user = null;
    notifyListeners();
  }
}
