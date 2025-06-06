import 'package:dreamary_flutter/features/auth/presentation/widgets/Header_login_sign_up.dart';
import 'package:dreamary_flutter/features/auth/presentation/widgets/TextRedirection.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../widgets/login_form.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeaderLoginSignUp(title: 'Explorez l\'univers de vos rêves', subtitle: ''),
            const LoginForm(),
            const SizedBox(height: 20),
            TextRedirection(text: 'Pas encore de compte ?', subText: 'Créer un compte'),
            ElevatedButton(
              onPressed: () {
                signInWithGoogle().then((UserCredential userCredential) {
                  Text("Connexion réussie : ${userCredential.user?.displayName}");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Connexion réussie : ${userCredential.user?.displayName}')),
                  );
                }).catchError((error) {
                  // Handle error
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Erreur de connexion : $error')),
                  );
                  print("Erreur de connexion : $error");
                });
              },
              child: Text('Se connecter avec Google')
            ),
          ],
        ),
      ),
    );
  }
}
