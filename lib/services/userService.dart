import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Userservice {
  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('users');


  Future<bool> checkIfEmailIsAlreadyUsed(String email) async {
    usersCollection.where("email", isEqualTo: email).get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        return true; // Email already exists
      } else {
        return false; // Email does not exist
      }
    }).catchError((error) {
      print("Error checking email: $error");
      return false; // Error occurred, assume email does not exist
    });
    return false; // Default return value, should be replaced by the actual logic
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> addUser(String userId, String email, String name, photoUrl, bio, username) async {
    await usersCollection.doc(userId).set({
      'email': email,
      'name': name,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

}