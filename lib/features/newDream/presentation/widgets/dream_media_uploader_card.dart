import 'package:flutter/material.dart';

class MediaUploadCard extends StatelessWidget {
  const MediaUploadCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.photo_camera_outlined, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  'Médias (optionnel)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _MediaButton(icon: Icons.photo_camera, label: 'Photo'),
                _MediaButton(icon: Icons.brush, label: 'Dessin'),
                _MediaButton(icon: Icons.mic, label: 'Audio'),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Ajoutez des images, dessins ou enregistrements pour enrichir votre rêve',
              style: TextStyle(color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _MediaButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _MediaButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        debugPrint('Bouton $label pressé');
      },
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }
}
