import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class HeaderLoginSignUp extends StatelessWidget {
  final String title;
  final String subtitle;

  const HeaderLoginSignUp({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInDown(
          child: Image.asset(
            'assets/images/Dreamary.png',
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
