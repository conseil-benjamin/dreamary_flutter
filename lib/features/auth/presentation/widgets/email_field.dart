import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final void Function(String) onChanged;
  const EmailField({required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      onChanged: onChanged,
      validator: (value) =>
      value != null && value.contains('@') ? null : 'Email invalide',
    );
  }
}
