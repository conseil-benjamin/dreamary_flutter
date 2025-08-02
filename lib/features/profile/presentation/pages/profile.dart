import 'package:dreamary_flutter/widgetsGlobal/BottomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Ici, vous pouvez utiliser les providers pour obtenir les données de l'utilisateur
    // Par exemple, vous pourriez utiliser un provider pour obtenir les informations de l'utilisateur.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: Center(
        child: Text('Page de profil de l\'utilisateur'),
      ),
      bottomNavigationBar: BottomAppBarWidget(),
    );
  }
}