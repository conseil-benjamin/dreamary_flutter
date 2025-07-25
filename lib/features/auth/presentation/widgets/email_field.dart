import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const EmailField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(color: Colors.grey[600]),
        prefixIcon: const Icon(Icons.email_outlined, color: Colors.black),
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
      onChanged: onChanged,
      validator: (value) => value != null && value.contains('@') ? null : 'Email invalide',
    );
  }
}
