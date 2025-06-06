import 'package:dreamary_flutter/features/auth/presentation/widgets/AccountButton.dart';
import 'package:dreamary_flutter/features/auth/presentation/widgets/account_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'email_field.dart';
import 'password_field.dart';
import 'package:animate_do/animate_do.dart';

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
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white, // 🔹 Couleur de fond
       // border: Border.all(
         // color: Theme.of(context).colorScheme.primary, // 🔹 Couleur de la bordure
         // width: 1,
        //),
        borderRadius: BorderRadius.circular(16), // 🔹 Coins arrondis
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Connexion',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text('Bon retour parmi nous !'),
            const SizedBox(height: 20),
            EmailField(onChanged: (val) => email = val),
            const SizedBox(height: 16),
            PasswordField(onChanged: (val) => password = val),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Se connecter'),
            ),
            const SizedBox(height: 16),
            const AccountLogin(),
          ],
        ),
      ),
    );
  }

}
