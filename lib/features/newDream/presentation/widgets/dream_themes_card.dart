import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/dream.dart';



class DreamThemesCard extends ConsumerStatefulWidget {
  const DreamThemesCard({super.key});

  @override
  ConsumerState<DreamThemesCard> createState() => _DreamThemesCardState();
}

class _DreamThemesCardState extends ConsumerState<DreamThemesCard> {
  final TextEditingController _themeController = TextEditingController();

  final List<String> popularThemes = [
    'Vol', 'Eau', 'Famille', 'Animaux', 'Ville', 'Nature', 'Poursuite', 'École'
  ];

  void _addTheme(String theme) {
    if (theme.isEmpty) return;
    ref.read(dreamFormProvider.notifier).toggleTheme(theme);
    debugPrint('Ajout du thème personnalisé : $theme');
    _themeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final dream = ref.watch(dreamFormProvider);
    final notifier = ref.read(dreamFormProvider.notifier);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Row(
              children: [
                Icon(Icons.local_offer_outlined, color: Colors.green),
                SizedBox(width: 8),
                Text(
                  'Thèmes et éléments',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            Wrap(
              spacing: 8.0,
              children: [
                for (var theme in dream.themes)
                  if (theme.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Chip(
                        backgroundColor: Colors.green[100],
                        label: Text(theme),
                        onDeleted: () => notifier.toggleTheme(theme),
                      ),
                    ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _themeController,
                    decoration: const InputDecoration(
                      hintText: 'Ajouter un thème...',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _addTheme(_themeController.text),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[100],
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Thèmes populaires',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: popularThemes.map((theme) {
                return ActionChip(
                  label: Text(theme),
                  onPressed: () {
                    _addTheme(theme);
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
