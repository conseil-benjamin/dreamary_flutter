import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreInformations extends ConsumerWidget{
  const MoreInformations({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var username = "";
    var bio = "";
    final prefs = SharedPreferences.getInstance();
    prefs.then((sharedPreferences) {
      sharedPreferences.get("userInformations");
    });


    return Scaffold(
      appBar: AppBar(
        title: const Text('Plus d\'informations'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Terminer votre inscription.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text("Veuillez définir un username"),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                username = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
                hintText: 'Entrez votre nom d\'utilisateur',
                prefixIcon: const Icon(Icons.person_outline),
              ),
            ),
            TextField(
              onChanged: (value) {
                bio = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Bio',
                hintText: 'Entrez votre bio',
                prefixIcon: const Icon(Icons.info_outline),
              ),
            )
          ],
        )
      ),
    );
  }
}