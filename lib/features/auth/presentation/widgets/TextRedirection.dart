import 'package:flutter/material.dart';

class TextRedirection extends StatelessWidget {
  final String text;
  final String subText;
  final VoidCallback onPressed;

  const TextRedirection({
    super.key,
    required this.text,
    required this.subText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: TextStyle(color: Colors.grey[600])),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
          ),
          child: Text(
            subText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
