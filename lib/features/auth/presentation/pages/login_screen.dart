import 'package:dreamary_flutter/features/auth/presentation/widgets/Header_login_sign_up.dart';
import 'package:flutter/material.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          ],
        ),
      ),
    );
  }
}
