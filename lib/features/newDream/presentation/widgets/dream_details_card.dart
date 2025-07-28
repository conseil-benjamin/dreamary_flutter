import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../models/dream.dart';

class DreamDetailsCard extends ConsumerWidget {
  const DreamDetailsCard({super.key});

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
                Icon(Icons.nightlight_round_outlined, size: 20),
                SizedBox(width: 8),
                Text('Détails du rêve', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Titre du rêve *',
                hintText: 'Ex: Vol au-dessus de Paris',
                border: OutlineInputBorder(),
              ),
              onChanged: notifier.setTitle,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: dream.date ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) notifier.setDate(picked);
                    },
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Date',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.calendar_today_outlined),
                      ),
                      child: Text(
                        dream.date != null
                            ? DateFormat('dd/MM/yyyy').format(dream.date!)
                            : 'Sélectionner la date',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      final picked = await showTimePicker(
                        context: context,
                        initialTime: dream.wakeUpTime ?? TimeOfDay.now(),
                      );
                      if (picked != null) notifier.setWakeUpTime(picked);
                    },
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Heure du réveil',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.access_time_outlined),
                      ),
                      child: Text(
                        dream.wakeUpTime != null
                            ? dream.wakeUpTime!.format(context)
                            : '--:--',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Description du rêve *',
                hintText:
                'Décrivez votre rêve en détail... Plus vous donnez de détails, meilleures seront vos analyses futures.',
                border: OutlineInputBorder(),
              ),
              onChanged: notifier.setDescription,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${dream.description.length} caractères',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
