import 'package:dreamary_flutter/models/dream.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewModels/dreamViewModel.dart';

class DreamDetails extends ConsumerWidget {
  final Dream? dream;
  const DreamDetails({super.key, required this.dream});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dream Details'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Dream Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Dream ID: ${dream?.id}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Dream ID: ${dream?.title}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        )
      ),
    );
  }
}