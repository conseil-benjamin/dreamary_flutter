import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamary_flutter/models/StateApp.dart';
import 'package:dreamary_flutter/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Userservice {
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');


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

  Future<bool> isAlreadyUsernameUsed(String username) async {
    final QuerySnapshot result = await usersCollection.where("username", isEqualTo: username).get();
    final List<DocumentSnapshot> documents = result.docs;
    if (documents.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<StateApp> addUser(String userId, String email, String name, String photoUrl, String bio, String username) async {
    // Check if the username is already used
    bool isUsernameUsed = await isAlreadyUsernameUsed(username);
    if (isUsernameUsed) {
      print("Username already used");
      return StateApp.usernameAlreadyTaken;
    } else {
      print('Username is available, proceeding to add user');
      UserModel user = UserModel(
        uid: userId,
        email: email,
        username: username,
        profilePictureUrl: photoUrl,
        bio: bio,
        fullName: name,
        metadata: {
          "accountStatus": "active",
          "isPremium": false,
          "lastDreamDate": FieldValue.serverTimestamp(),
          'createdAt': FieldValue.serverTimestamp(),
          'lastLogin': FieldValue.serverTimestamp(),
        },
        preferences: {
          "notifications": true,
          "theme": "dark",
          "isPrivateProfile": false,
          "language": "fr"
        },
        dreamStats: {
          "nightmares": 0,
          "totalDreams": 0,
          "lucidDreams": 0,
          "longestStreak": 0,
          "currentStreak": 0
        },
        progression: {
          "xpNeeded": 1000,
          "level": 1,
          "xp": 0,
          "rank": "Débutant"
        },
        social: {
          "groups": <String>[],
          "followers": 0,
          "following": 0
        },
      );
      await usersCollection.doc(userId).set(user.toMap()).then(
            (value) async {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool("hasMoreInformationToComplete", false);
        },
      ).catchError((error) {
        print("Error adding user: $error");
        return StateApp.error;
      });
      return StateApp.successfullyAddedUser;
    }
  }

  Future<UserModel> getUser(String userId) async {
    try {
      DocumentSnapshot doc = await usersCollection.doc(userId).get();
      if (doc.exists) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("User not found");
      }
    } catch (error) {
      throw Exception("Error retrieving user data: $error");
    }
  }
}