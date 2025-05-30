import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const EmailField({required this.onChanged, super.key});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'votre@email.com',
          prefixIcon: Icon(Icons.email_outlined, color: Theme.of(context).colorScheme.primary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 0.1),
          ),
      ),
      style: new TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 5,
      ),
      onChanged: widget.onChanged,
      validator: (value) =>
      value != null && value.contains('@') ? null : 'Email invalide',
    );
  }
}
