import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuyPremium extends StatelessWidget{
  const BuyPremium({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Devenez membre Premium',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/premiumPresentation');
            },
            child: const Text('Acheter Premium'),
          ),
        ],
      ),
    );
  }
}