import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonAccount extends StatelessWidget{
  final String text;

  const ButtonAccount({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            // Action pour le bouton "Créer un compte"
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              text == 'Google' ? Icon(Icons.abc, color: Theme.of(context).colorScheme.onSurface) :
              Icon(Icons.apple, color: Theme.of(context).colorScheme.onSurface),
              SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
            ],
          )
        ),
      ],
    );
  }
}