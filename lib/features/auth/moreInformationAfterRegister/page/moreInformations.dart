import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:dreamary_flutter/viewModels/userViewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreInformations extends ConsumerStatefulWidget {
  const MoreInformations({super.key});

  @override
  ConsumerState<MoreInformations> createState() => _MoreInformationsState();
}

class _MoreInformationsState extends ConsumerState<MoreInformations> {
  var username = "";
  var bio = "";
  final user = FirebaseAuth.instance.currentUser;
  Userviewmodel usermodel = Userviewmodel();
  File? imageFile; // 🔸 image choisie

  void setImage(File file) {
    setState(() {
      imageFile = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Plus d\'informations')),
      body: Center(
        child: Column(
          children: [
            const Text('Terminer votre inscription.', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const Text("Veuillez définir un username"),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => username = value,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
                hintText: 'Entrez votre nom d\'utilisateur',
                prefixIcon: const Icon(Icons.person_outline),
              ),
            ),
            TextField(
              onChanged: (value) => bio = value,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Bio',
                hintText: 'Entrez votre bio',
                prefixIcon: const Icon(Icons.info_outline),
              ),
            ),
            // 🔻 Ici on passe une callback à l’enfant pour qu’il nous envoie l’image
            MyImagePickerWidget(onImageSelected: setImage),
            ElevatedButton(
              onPressed: () async {
                if (user != null && username.isNotEmpty && bio.isNotEmpty && imageFile != null) {
                  // imageFile est bien définie ici ✅
                  await usermodel.addUser(
                    user!.uid,
                    user?.email ?? '',
                    user?.displayName ?? '',
                    imageFile!.path, // exemple
                    bio,
                    username,
                  ).then((value) {
                    Navigator.of(context).pushNamedAndRemoveUntil("/onBoarding", (_) => false);
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Veuillez remplir tous les champs et choisir une image')),
                  );
                }
              },
              child: const Text("Terminer l'inscription"),
            ),
          ],
        ),
      ),
    );
  }
}


class MyImagePickerWidget extends StatefulWidget {
  final void Function(File) onImageSelected;

  const MyImagePickerWidget({super.key, required this.onImageSelected});

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
      final selectedFile = File(returnImage.path);
      setState(() {
        image = selectedFile;
      });
      widget.onImageSelected(selectedFile); // ⬅️ On renvoie l’image au parent ici
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _pickImageFromGallery,
          child: const Text("Choisir une image"),
        ),
        if (image != null)
          ClipOval(
            child: SizedBox(
              width: 120,
              height: 120,
              child: Image.file(
                image!,
                fit: BoxFit.cover,
              ).bounceInRight(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              ),
            ),
          ),
      ],
    );
  }
}
