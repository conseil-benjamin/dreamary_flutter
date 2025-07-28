import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/dream.dart';

class DreamCharacteristicsCard extends ConsumerWidget {
  const DreamCharacteristicsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dream = ref.watch(dreamFormProvider);
    final notifier = ref.read(dreamFormProvider.notifier);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.star_border, size: 20),
                SizedBox(width: 8),
                Text('Caractéristiques', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),

            // Niveau de lucidité
            _buildSlider(
              context: context,
              label: 'Niveau de lucidité',
              value: dream.lucidity.toDouble(),
              onChanged: (v) => notifier.setLucidity(v.round()),
              divisions: 4,
              minLabel: 'Pas conscient',
              maxLabel: 'Totalement lucide',
              color: Colors.pinkAccent,
            ),

            const SizedBox(height: 12),

            // Clarté du souvenir
            _buildSlider(
              context: context,
              label: 'Clarté du souvenir',
              value: dream.clarity.toDouble(),
              onChanged: (v) => notifier.setClarity(v.round()),
              divisions: 4,
              minLabel: 'Très flou',
              maxLabel: 'Très clair',
              color: Colors.deepOrangeAccent,
            ),

            const SizedBox(height: 12),

            // Durée perçue
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Durée perçue',
                border: OutlineInputBorder(),
              ),
              value: dream.duration,
              items: [
                'Quelques secondes',
                'Quelques minutes',
                'Environ 1h',
                'Plusieurs heures',
                'Difficile à estimer',
              ].map((label) {
                return DropdownMenuItem<String>(
                  value: label,
                  child: Text(label),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) notifier.setDuration(value);
              },
            ),

            const SizedBox(height: 12),

            // Qualité du sommeil
            _buildSlider(
              context: context,
              label: 'Qualité du sommeil',
              value: dream.sleepQuality.toDouble(),
              onChanged: (v) => notifier.setSleepQuality(v.round()),
              divisions: 4,
              minLabel: 'Très mauvais',
              maxLabel: 'Excellent',
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider({
    required BuildContext context,
    required String label,
    required double value,
    required void Function(double) onChanged,
    required int divisions,
    required String minLabel,
    required String maxLabel,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label (${value.round() + 1}/5)', style: Theme.of(context).textTheme.labelLarge),
        Slider(
          value: value,
          onChanged: onChanged,
          min: 0,
          max: 4,
          divisions: divisions,
          activeColor: color,
          label: '${value.round() + 1}',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(minLabel, style: Theme.of(context).textTheme.labelSmall),
            Text(maxLabel, style: Theme.of(context).textTheme.labelSmall),
          ],
        ),
      ],
    );
  }
}
