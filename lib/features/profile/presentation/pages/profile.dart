import 'package:dreamary_flutter/features/profile/presentation/widgets/StatsProfile.dart';
import 'package:dreamary_flutter/models/user.dart';
import 'package:dreamary_flutter/widgetsGlobal/BottomAppBar.dart';
import 'package:dreamary_flutter/widgetsGlobal/BuyPremium.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/firebase_provider.dart';
import '../../../../viewModels/userViewModel.dart';
import '../widgets/HeaderProfile.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Userviewmodel usermodel = Userviewmodel();
    final userFirebase = ref.watch(currentUserProvider);
    final user = usermodel.getUser(userFirebase?.uid ?? '');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: Center(
        child: FutureBuilder<UserModel>(
          future: user,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Erreur: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final userData = snapshot.data!;
              return Column(
                children: [
                  Headerprofile(userData: userData),
                  const SizedBox(height: 20),
                  StatsProfile(userData: userData),
                  userData.metadata['isPremium'] == true
                      ? const Text('Vous êtes membre Premium', style: TextStyle(fontSize: 18))
                      : BuyPremium()
                ],
              );
            } else {
              return const Text('Aucune donnée disponible');
            }
          },
        )
        ),
      bottomNavigationBar: BottomAppBarWidget()
    );
  }
}