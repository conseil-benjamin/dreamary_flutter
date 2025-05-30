import 'package:dreamary_flutter/features/auth/presentation/widgets/AccountButton.dart';
import 'package:flutter/material.dart';

class AccountLogin extends StatefulWidget {
    const AccountLogin({Key? key}) : super(key: key);

    @override
    State<AccountLogin> createState() => _AccountLoginState();
}

class _AccountLoginState extends State<AccountLogin> {
    @override
    Widget build(BuildContext context) {
       return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                ButtonAccount(text: 'Google',),
                SizedBox(width: 10),
                ButtonAccount(text: 'Apple'),
            ],
       );
    }
}