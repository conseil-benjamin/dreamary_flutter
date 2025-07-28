import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/dream.dart';
import '../../../../viewModels/dreamViewModel.dart';

class RecentDreams extends ConsumerWidget{
  const RecentDreams({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dreamViewModel = DreamViewModel();

    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rêves récents',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8.0),
          FutureBuilder<List<Dream>>(
            future: dreamViewModel.getRecentDreams(),
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
                    return Card(
                      elevation: 0,
                      child: ListTile(
                        title: Text(dream.title ?? 'Titre du rêve'),
                        subtitle: Text(dream.description),
                        trailing: Icon(Icons.more_vert),
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