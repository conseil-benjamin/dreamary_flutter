import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeInDown(
          child: Image.asset(
            'assets/images/Dreamary.png',
            height: 75,
            width: 75,
            fit: BoxFit.cover,
            opacity: const AlwaysStoppedAnimation(0.8),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        subtitle.length > 0 ? Text(subtitle) : const SizedBox.shrink(),
      ],
    );
    throw UnimplementedError();
  }
}