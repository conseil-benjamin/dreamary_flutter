import 'package:flutter/material.dart';

// 1. Déclaration du Widget principal
class PasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;

  // Constructeur avec un paramètre requis
  const PasswordField({Key? key, required this.onChanged}) : super(key: key);

  // Lien vers l'état associé
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

// 2. Classe d’état (mutable) du widget
class _PasswordFieldState extends State<PasswordField> {
  // 2.1 Variable d'état pour gérer la visibilité du mot de passe
  bool isObscure = true;
  String password = '';
  String labelInput = '*******';

  // 2.2 Méthode pour basculer la visibilité
  void _toggleVisibility() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  // 2.3 Méthode build : ce qui est affiché à l’écran
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure, // Utilise la variable d’état
      decoration: InputDecoration(
        labelText: labelInput,
        prefixIcon: Icon(Icons.lock_outline, color: Theme.of(context).colorScheme.primary, size: 20),
        suffixIcon: IconButton(
          icon: Icon(
            isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: _toggleVisibility,
        ),
        border: OutlineInputBorder(),
      ),
      onTap: () {
        setState(() {
          labelInput = 'Mot de passe';
        });
      },
      onTapOutside: (_) {
        setState(() {
          labelInput = '*******';
        });
      },
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 12,
      ),
      onChanged: widget.onChanged, // Appelle la fonction fournie par le parent
      validator: (value) =>
      value != null && value.length >= 6 ? null : 'Mot de passe invalide',
    );
  }
}
