import 'package:dreamary_flutter/features/homeScreen/presentation/page/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dreamary_flutter/features/auth/presentation/pages/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final isLoggedIn = snapshot.data == true;

        return isLoggedIn ? const Homescreen() : const LoginScreen();
      },
    );
  }

  Future<bool> _checkLoginStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    return user != null;
  }
}