import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/dream.dart';


class DreamEmotionsCard extends ConsumerWidget {
  const DreamEmotionsCard({super.key});

  static const moods = [
    {'label': 'Joyeux', 'color': Colors.lightGreen, 'icon': Icons.sentiment_satisfied},
    {'label': 'Paisible', 'color': Colors.lightBlue, 'icon': Icons.self_improvement},
    {'label': 'Mystérieux', 'color': Colors.deepPurpleAccent, 'icon': Icons.visibility},
    {'label': 'Nostalgique', 'color': Colors.orangeAccent, 'icon': Icons.history},
    {'label': 'Anxieux', 'color': Colors.redAccent, 'icon': Icons.warning},
    {'label': 'Excité', 'color': Colors.amber, 'icon': Icons.flash_on},
  ];

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
                Icon(Icons.favorite_border, size: 20),
                SizedBox(width: 8),
                Text('Émotions et type', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),

            // Boutons humeur
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: moods.map((mood) {
                final isSelected = dream.moods.contains(mood['label']);
                return FilterChip(
                  label: Text(mood['label'] as String),
                  avatar: Icon(mood['icon'] as IconData, size: 18),
                  selected: isSelected,
                  backgroundColor: (mood['color'] as Color).withOpacity(0.2),
                  selectedColor: mood['color'] as Color,
                  onSelected: (_) => notifier.toggleMood(mood['label'] as String),
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            // Cauchemar
            SwitchListTile(
              title: const Text('Cauchemar'),
              subtitle: const Text('Ce rêve était-il effrayant ?'),
              value: dream.isNightmare,
              onChanged: (newValue) => notifier.setIsNightmare(newValue),
            ),

            // Rêve récurrent
            SwitchListTile(
              title: const Text('Rêve récurrent'),
              subtitle: const Text('Avez-vous déjà fait ce rêve ?'),
              value: dream.isRecurring,
              onChanged: (newValue) => notifier.setIsRecurring(newValue),
            ),
          ],
        ),
      ),
    );
  }
}
