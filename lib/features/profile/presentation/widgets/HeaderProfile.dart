import 'package:animate_do/animate_do.dart';
import 'package:dreamary_flutter/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class Headerprofile extends StatelessWidget {
  final UserModel userData;

  const Headerprofile({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    double xpProgress = userData.progression['xp'] / userData.progression['xpNeeded'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipOval(
          child: SizedBox(
            width: 120,
            height: 120,
            child: Image.network(
              userData.profilePictureUrl,
              fit: BoxFit.cover,
            ).bounceInRight(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            ),
          ),
        ),
        Text(
          '${userData.fullName}',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          '${userData.email}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Chip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: Colors.white54,
              label: Text('Niveau ${userData.progression['level']}'),
            ),
            Chip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: Colors.white54,
              label: Text(
                userData.metadata['isPremium'] ? 'Membre Premium' : 'Membre Gratuit',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${userData.progression['xp']} XP', style: Theme.of(context).textTheme.bodyMedium),
            Text(
              '${userData.progression['xpNeeded']} XP',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinearPercentIndicator(
              animation: true,
              barRadius: const Radius.circular(8.0),
              width: 300.0,
              lineHeight: 14.0,
              percent: xpProgress,
              backgroundColor: Colors.grey,
              progressColor: Colors.blue,
            )
          ],
        ),
        Text(
          'Membre depuis ${userData.metadata['createdAt'].toDate().toLocal().toString().split(' ')[0]}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}