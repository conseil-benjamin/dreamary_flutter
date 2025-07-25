import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final String text;

  const AccountButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey),
      ),
      child: IconButton(
        icon: Icon(
          text == 'Google' ? Icons.login : Icons.apple,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
    );
  }
}
