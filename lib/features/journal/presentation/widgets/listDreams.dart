

import 'package:dreamary_flutter/models/dream.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/firebase_provider.dart';
import '../../../../viewModels/dreamViewModel.dart';

class ListDreams extends ConsumerWidget{
  const ListDreams({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dreamViewModel = DreamViewModel();
    final user = ref.watch(currentUserProvider);

    return Container(
      color: Theme.of(context).colorScheme.surface,
      height: MediaQuery.of(context).size.height * 0.8,
      child: FutureBuilder<List<Dream>>(
        future: dreamViewModel.getDreams(user?.uid ?? ''),
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
                return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/dream_details', arguments: dream);
                    },
                    child: _dream_Card(dream: dream),
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

class _dream_Card extends StatelessWidget {
  final Dream dream;

  const _dream_Card({required this.dream});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dream.title ?? 'Sans titre',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                dream.date != null
                    ? 'Date: ${dream.date!.toLocal().toIso8601String().substring(0, 10)}'
                    : 'Date inconnue',
              ),
            ],
          ),
          Text(
            dream.description ?? 'Sans description',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
          if (dream.moods.isNotEmpty)
            Wrap(
              spacing: 2.0,
              children: dream.moods.map((emotion) => Chip(label: Text(emotion))).toList(),
            ),
        ],
      ),
    );
  }
}