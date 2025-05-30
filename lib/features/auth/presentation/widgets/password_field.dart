import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final void Function(String) onChanged;
  const PasswordField({required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      onChanged: onChanged,
      validator: (value) =>
      value != null && value.contains('@') ? null : 'Password invalide',
    );
  }
}
