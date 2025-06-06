import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextRedirection extends StatelessWidget {
  final String text;
  final String subText;

  const TextRedirection({
    super.key,
    required this.text,
    required this.subText,
  });
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        TextButton(
          onPressed: () {
            text == 'Déjà un compte ?' ? Navigator.pushNamed(context, '/login') : Navigator.pushNamed(context, '/register');
          },
          child: Text(
            subText,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          )
        )
      ],
    );
  }
}