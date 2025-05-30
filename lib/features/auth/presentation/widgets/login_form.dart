import 'package:flutter/material.dart';
import 'email_field.dart';
import 'password_field.dart';

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
      // Faire appel à l’authentification
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(image: AssetImage('/images/Dreamary.png')),
          EmailField(onChanged: (val) => email = val),
          PasswordField(onChanged: (val) => password = val),
          ElevatedButton(
            onPressed: _submit,
            child: Text('Se connecter'),
          ),
        ],
      ),
    );
  }
}
