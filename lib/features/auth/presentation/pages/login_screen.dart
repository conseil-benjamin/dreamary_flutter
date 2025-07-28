import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../widgets/Header_login_sign_up.dart';
import '../widgets/TextRedirection.dart';
import '../widgets/login_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 80),
              const HeaderLoginSignUp(
                title: 'Explorez l\'univers de vos rêves',
                subtitle: 'Connectez-vous pour continuer',
              ),
              const SizedBox(height: 40),
              const LoginForm(),
              const SizedBox(height: 20),
              TextRedirection(
                text: 'Pas encore de compte ?',
                subText: 'Créer un compte',
                onPressed: () => Navigator.pushNamed(context, '/moreInformationAfterRegister'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
