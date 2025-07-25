import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const PasswordField({super.key, required this.onChanged});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObscure = true;

  void _toggleVisibility() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: 'Mot de passe',
        labelStyle: TextStyle(color: Colors.grey[600]),
        prefixIcon: const Icon(Icons.lock_outline, color: Colors.black),
        suffixIcon: IconButton(
          icon: Icon(
            isObscure ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey[600],
          ),
          onPressed: _toggleVisibility,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
      style: const TextStyle(color: Colors.black),
      onChanged: widget.onChanged,
      validator: (value) => value != null && value.length >= 6 ? null : 'Mot de passe invalide',
    );
  }
}
