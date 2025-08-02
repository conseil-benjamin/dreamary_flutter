import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomAppBarWidget extends ConsumerWidget{
  const BottomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;

    return BottomAppBar(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: 50,
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                padding: const EdgeInsets.all(0),
                icon: Icon(Icons.home, color: theme.onSurface),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/home');
                },
              ),
              Text(
                'Accueil',
                style: TextStyle(color: theme.onSurface, fontSize: 12),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.menu_book, color: theme.onSurface),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/journal');
                },
              ),
              Text(
                'Journal',
                style: TextStyle(color: theme.onSurface, fontSize: 12),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.query_stats_sharp, color: theme.onSurface),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/stats');
                },
              ),
              Text(
                'Stats',
                style: TextStyle(color: theme.onSurface, fontSize: 12),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.chat_outlined, color: theme.onSurface),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/social');
                },
              ),
              Text(
                'Social',
                style: TextStyle(color: theme.onSurface, fontSize: 12),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.person, color: theme.onSurface),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/profile');
                },
              ),
              Text(
                'Profil',
                style: TextStyle(color: theme.onSurface, fontSize: 12),
              ),
            ],
          ),
        ],
      ));
  }
}