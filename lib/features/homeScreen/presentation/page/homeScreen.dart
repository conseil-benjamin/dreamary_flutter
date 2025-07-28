import 'package:dreamary_flutter/features/homeScreen/presentation/widgets/recentsDream.dart';
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
              FirebaseAuth.instance.signOut();
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
              FirebaseAuth.instance.signOut();
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
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        height: 50,
        color: Colors.deepPurple,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: const Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/home');
                  },
                ),
                Text(
                  'Accueil',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.menu_book, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/dreams');
                  },
                ),
                Text(
                  'Journal',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.query_stats_sharp, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/stats');
                  },
                ),
                Text(
                  'Stats',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.chat_outlined, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/social');
                  },
                ),
                Text(
                  'Social',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.person, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/profile');
                  },
                ),
                Text(
                  'Profil',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ],
      ),
    )
    );

    throw UnimplementedError();
  }







}
