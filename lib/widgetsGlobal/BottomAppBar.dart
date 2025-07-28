import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomAppBarWidget extends ConsumerWidget{
  const BottomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomAppBar(
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
                  Navigator.of(context).pushReplacementNamed('/journal');
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
      ));
  }
}