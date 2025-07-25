import 'package:flutter/material.dart';
import 'email_field.dart';
import 'password_field.dart';
import 'account_login.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Call authentication logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text(
              'Connexion',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Bon retour parmi nous !', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),
            EmailField(onChanged: (val) => email = val),
            const SizedBox(height: 16),
            PasswordField(onChanged: (val) => password = val),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Se connecter', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16),
            const AccountLogin(),
          ],
        ),
      ),
    );
  }
}
