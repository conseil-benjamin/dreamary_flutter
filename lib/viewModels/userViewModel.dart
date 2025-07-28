import 'dart:ffi';

import 'package:dreamary_flutter/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/dreamService.dart';
import '../services/userService.dart';

class Userviewmodel {
  final Userservice firebaseServiceUser = Userservice();

  Future<bool> signInWithGoogle() async {
    try {
      UserCredential user = await firebaseServiceUser.signInWithGoogle();
      if (user == null) {
        throw Exception("Utilisateur non trouvé");
      }
      // Vérifier si l'utilisateur existe déjà dans la base de données
      bool userExists = await firebaseServiceUser.checkIfEmailIsAlreadyUsed(user.user?.email ?? '');
      if (!userExists) {
        // Si l'utilisateur n'existe pas, l'ajouter

        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool("hasMoreInformationToComplete", true);
        await prefs.setStringList("userInformations", [user.user?.email ?? '', user.user?.displayName ?? '', user.user?.photoURL ?? '']);
      }
      return true;
    } catch (error) {
      throw Exception("Erreur lors de la récupération des données utilisateur : $error");
    }
  }

  Future<bool> addUser(String userId, String email, String name, String photoUrl, String bio, String username) async {
      await firebaseServiceUser.addUser(userId, email, name, photoUrl, bio, username).then(
        (value) async {
        },
      ).catchError((error) {
        throw Exception("Erreur lors de l'ajout de l'utilisateur : $error");
        return false;
      });
      return true;
  }
}