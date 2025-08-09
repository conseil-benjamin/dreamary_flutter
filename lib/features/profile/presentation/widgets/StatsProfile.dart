import 'package:dreamary_flutter/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatsProfile extends StatelessWidget {
  final UserModel userData;

  const StatsProfile({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                child: Column(
                  children: [
                    Icon(Icons.star, size: 50, color: Theme.of(context).colorScheme.primary),
                    Text('${userData.dreamStats['currentStreak']}', style: Theme.of(context).textTheme.headlineMedium),
                    Text('Série actuelle', style: Theme.of(context).textTheme.headlineSmall),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Icon(Icons.history, size: 50, color: Theme.of(context).colorScheme.primary),
                    Text('${userData.dreamStats['totalDreams']}', style: Theme.of(context).textTheme.headlineMedium),
                    Text('Rêves totaux', style: Theme.of(context).textTheme.headlineSmall),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                child: Column(
                  children: [
                    Icon(Icons.calendar_today, size: 50, color: Theme.of(context).colorScheme.primary),
                    Text('${userData.dreamStats['daysWithDreams']}', style: Theme.of(context).textTheme.headlineMedium),
                    Text('Jours avec rêves', style: Theme.of(context).textTheme.headlineSmall),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Icon(Icons.pie_chart, size: 50, color: Theme.of(context).colorScheme.primary),
                    Text('${userData.progression['level']}', style: Theme.of(context).textTheme.headlineMedium),
                    Text('Niveau', style: Theme.of(context).textTheme.headlineSmall),
                  ],
                ),
              )
            ],
          )
        ],
      )
    );
  }
}