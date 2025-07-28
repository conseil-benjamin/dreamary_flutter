

import 'package:dreamary_flutter/models/dream.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../viewModels/dreamViewModel.dart';

class ListDreams extends ConsumerWidget{
  const ListDreams({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dreamViewModel = DreamViewModel();

    return Container(
      color: Colors.white, // Couleur de fond
      child: FutureBuilder<List<Dream>>(
        future: dreamViewModel.getDreams(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final dreams = snapshot.data!;
            return ListView.builder(
              itemCount: dreams.length,
              itemBuilder: (context, index) {
                final dream = dreams[index];
                return ListTile(
                  title: Text(dream.title),
                  subtitle: Text(dream.description),
                );
              },
            );
          } else {
            return Center(child: Text('Aucun rêve trouvé.'));
          }
        },
      ),
    );
  }
}