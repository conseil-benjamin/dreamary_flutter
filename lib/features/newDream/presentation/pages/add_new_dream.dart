import 'dart:async';

import 'package:dreamary_flutter/features/newDream/presentation/widgets/dream_themes_card.dart';
import 'package:dreamary_flutter/styles/themeSwitcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../models/dream.dart';
import '../../../../viewModels/dreamViewModel.dart';
import '../widgets/dream_characteristics_card.dart';
import '../widgets/dream_details_card.dart';
import '../widgets/dream_emotions_card.dart';
import '../widgets/dream_media_uploader_card.dart';

class AddDreamScreen extends ConsumerWidget {
  const AddDreamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dreamForm = ref.watch(dreamFormProvider);
    final dreamViewModel = DreamViewModel();
    final user = FirebaseAuth.instance.currentUser;
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Nouveau rêve',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: false,
        actions: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white),
                ),
                onPressed: () {
                  print('OutlinedButton pressed');
                },
                child: Text('Brouillon'),
              ),
              ButtonTheme(
                  minWidth: 0,
                  padding: const EdgeInsets.all(8),
                  child: TextButton(
                      onPressed: Navigator.of(context).pop,
                      child: const Text(
                        'Effacer',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )
                  )
              ),
          ]
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const DreamDetailsCard(),
            const SizedBox(height: 16),
            const DreamCharacteristicsCard(),
            const SizedBox(height: 16),
            const DreamEmotionsCard(),
            const SizedBox(height: 24),
            const DreamThemesCard(),
            const SizedBox(height: 24),
            const MediaUploadCard(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    debugPrint('Sauvegarde en brouillon');
                  },
                  child: const Text('Sauvegarder en brouillon'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      if (dreamForm.title.isEmpty || dreamForm.description.isEmpty || dreamForm.date == null || dreamForm.wakeUpTime == null || dreamForm.moods.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Veuillez remplir tous les champs obligatoires.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }
                      ref.read(dreamFormProvider.notifier).setUserId(user!.uid);
                      final updatedDream = ref.read(dreamFormProvider); // Maintenant c’est à jour
                      await dreamViewModel.addDream(updatedDream);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Rêve ajouté avec succès!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Timer(const Duration(seconds: 2), () {
                        Navigator.of(context).pop();
                      });
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Erreur lors de l\'ajout du rêve : $error'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Text('Ajouter un rêve'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
