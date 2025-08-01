import 'dart:io';

import 'package:dreamary_flutter/viewModels/userViewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreInformations extends ConsumerWidget{
  const MoreInformations({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    var username = "";
    var bio = "";
    final user = FirebaseAuth.instance.currentUser;
    Userviewmodel usermodel = Userviewmodel();
    File ? imageFile;

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
            ),
            ElevatedButton(
              onPressed: () async {
                if (user != null && username.isNotEmpty && bio.isNotEmpty) {
                  await usermodel.addUser(
                    user.uid,
                    user.email ?? '',
                    user.displayName ?? '',
                    user.photoURL ?? '',
                    bio,
                    username,
                  ).then((value) async {
                    Navigator.of(context).pushNamedAndRemoveUntil("/onBoarding", (Route<dynamic> route) => false);
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Veuillez remplir tous les champs')),
                  );
                }
              },
              child: Text("Terminer l'inscription"),
            ),
            MyImagePickerWidget(),
          ],
        )
      ),
    );
  }
}

class MyImagePickerWidget extends StatefulWidget {
  @override
  _MyImagePickerWidgetState createState() => _MyImagePickerWidgetState();
}

class _MyImagePickerWidgetState extends State<MyImagePickerWidget> {
  File? image;

  Future<void> _pickImageFromGallery() async {
    final returnImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (returnImage != null) {
      setState(() {
        image = File(returnImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _pickImageFromGallery,
          child: Text("Choisir une image"),
        ),
        if (image != null) Image.file(image!),
      ],
    );
  }
}
