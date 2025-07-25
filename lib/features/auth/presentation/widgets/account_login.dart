import 'package:flutter/material.dart';
import 'AccountButton.dart';

class AccountLogin extends StatelessWidget {
  const AccountLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('ou connectez-vous avec', style: TextStyle(color: Colors.grey)),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AccountButton(text: 'Google'),
            SizedBox(width: 10),
            AccountButton(text: 'Apple'),
          ],
        ),
      ],
    );
  }
}
