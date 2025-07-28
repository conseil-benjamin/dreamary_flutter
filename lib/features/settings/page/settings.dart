import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Settings extends ConsumerWidget{
  const Settings ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pushNamedAndRemoveUntil(
              "/login",
                  (Route<dynamic> route) => false, // Supprime toutes les routes
            );
            },
          child: Text("Sign Out"),
        )
      ),
    );
  }
}