import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../viewModels/userViewModel.dart';

class AccountButton extends StatelessWidget {
  final String text;

  const AccountButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    Userviewmodel userViewModel = Userviewmodel();

    Future<UserCredential> signInWithApple() async {
      // Implement Apple sign-in logic here
      // This is a placeholder for the actual implementation
      throw UnimplementedError('Apple sign-in not implemented');
    }

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey),
      ),
      child: IconButton(
        icon: Icon(
          text == 'Google' ? Icons.login : Icons.apple,
          color: Colors.black,
        ),
        onPressed: () async {
          // Handle the button press
          if (text == 'Google') {
            bool needMoreInformation = await userViewModel.signInWithGoogle();
            if (needMoreInformation == true) {
              Navigator.of(context).pushNamedAndRemoveUntil("/moreInformationAfterRegister", (Route<dynamic> route) => false);
            } else {
              Navigator.of(context).pushNamedAndRemoveUntil("/home", (Route<dynamic> route) => false);
            }
          } else {
            signInWithApple().then((UserCredential userCredential) {
              Navigator.pushNamed(context, '/home');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Connexion réussie : ${userCredential.user?.displayName}'),
                  backgroundColor: Colors.green,
                ),
              );
            }).catchError((error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Erreur de connexion : $error'),
                  backgroundColor: Colors.red,
                ),
              );
            });
          }
        },
      ),
    );
  }
}
