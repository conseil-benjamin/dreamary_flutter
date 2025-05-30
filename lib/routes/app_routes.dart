import 'package:dreamary_flutter/features/auth/presentation/pages/login_screen.dart';
import 'package:dreamary_flutter/features/auth/presentation/pages/sign_up_screeb.dart';
import 'package:flutter/material.dart';
import 'route_names.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteNames.register:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Aucune route pour ${settings.name}')),
          ),
        );
    }
  }
}
