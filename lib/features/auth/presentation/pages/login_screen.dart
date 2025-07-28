import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../widgets/Header_login_sign_up.dart';
import '../widgets/TextRedirection.dart';
import '../widgets/login_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

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
                onPressed: () => Navigator.pushNamed(context, '/register'),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  signInWithGoogle().then((UserCredential userCredential) {
                    Navigator.pushNamed(context, '/add_new_dream');
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
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                icon: const Icon(Icons.login, color: Colors.white),
                label: const Text('Se connecter avec Google', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
