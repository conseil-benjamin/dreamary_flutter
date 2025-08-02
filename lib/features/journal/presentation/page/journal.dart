import 'package:dreamary_flutter/features/journal/presentation/widgets/listDreams.dart';
import 'package:dreamary_flutter/widgetsGlobal/BottomAppBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Journal extends ConsumerWidget {
  const Journal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          ButtonTheme(
            minWidth: 0,
            padding: const EdgeInsets.all(8),
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Effacer',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
        ],
        title: const Text('Journal'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ListDreams()
          ],
        )
      ),
      bottomNavigationBar: BottomAppBarWidget(),
    );
  }
}