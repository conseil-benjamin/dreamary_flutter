import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../models/dream.dart';
import '../../../../viewModels/dreamViewModel.dart';

class RecentDreams extends ConsumerWidget{
  const RecentDreams({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dreamViewModel = DreamViewModel();
    final user = FirebaseAuth.instance.currentUser;

    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mes derniers rêves',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/add_new_dream'), child: Text("Ajouter")),
            ],
          ),
          const SizedBox(height: 8.0),
          FutureBuilder<List<Dream>>(
            future: dreamViewModel.getRecentDreams(user?.uid ?? ''),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erreur: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('Aucun rêve récent trouvé.'));
              } else {
                final dreams = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: dreams.length,
                  itemBuilder: (context, index) {
                    final dream = dreams[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/dream_details', arguments: dream);
                      },
                        child: Card(
                            elevation: 0,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      dream.title,
                                      style: Theme.of(context).textTheme.titleMedium,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      dream.date != null
                                          ? DateFormat('dd/MM/yyyy').format(dream.date!)
                                          : 'Date inconnue',
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    dream.description,
                                    style: Theme.of(context).textTheme.bodyMedium,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        for (var i = 0; i < dream.moods.length && i < 2; i++)
                                          if (dream.moods.toList()[i].isNotEmpty)
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: Chip(
                                                backgroundColor: Colors.green[100],
                                                label: Text(dream.moods.toList()[i]),
                                              ),
                                            ),
                                        const SizedBox(width: 8),
                                        if (dream.moods.length > 2 )
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.green[500], // Choisis la couleur de fond que tu préfères
                                              borderRadius: BorderRadius.circular(12), // Optionnel : pour arrondir les coins
                                            ),
                                            padding: EdgeInsets.all(4), // Optionnel : pour ajouter un espace autour du texte
                                            child: Text(
                                              "+${dream.moods.length - 2}",
                                            ),
                                          )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                        ),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}