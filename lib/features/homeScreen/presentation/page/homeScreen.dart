import 'package:dreamary_flutter/features/homeScreen/presentation/widgets/recentsDream.dart';
import 'package:dreamary_flutter/widgetsGlobal/BottomAppBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../models/dream.dart';
import '../../../../styles/theme_provider.dart';
import '../../../../viewModels/dreamViewModel.dart';

class Homescreen extends ConsumerWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = FirebaseAuth.instance.currentUser;
    final themeMode = ref.watch(themeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Bonjour ${user?.displayName ?? 'Invité'}',
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white, size: 20),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/settings');
            },
          ),
          IconButton(
            icon: themeMode == ThemeMode.dark
                ? const Icon(Icons.light_mode, color: Colors.white, size: 20)
                : const Icon(Icons.dark_mode, color: Colors.white, size: 20),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleTheme();
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white, size: 20),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/settings');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RecentDreams(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBarWidget()
    );
  }
}
