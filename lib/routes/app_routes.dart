import 'package:dreamary_flutter/features/auth/moreInformationAfterRegister/page/moreInformations.dart';
import 'package:dreamary_flutter/features/auth/presentation/pages/login_screen.dart';
import 'package:dreamary_flutter/features/auth/presentation/pages/sign_up_screeb.dart';
import 'package:dreamary_flutter/features/homeScreen/presentation/page/homeScreen.dart';
import 'package:dreamary_flutter/features/journal/presentation/page/journal.dart';
import 'package:dreamary_flutter/features/profile/presentation/pages/profile.dart';
import 'package:dreamary_flutter/features/settings/page/settings.dart';
import 'package:flutter/material.dart';
import '../features/onBoarding/presentation/page/onBoarding.dart';
import 'route_names.dart';
import 'package:dreamary_flutter/features/newDream/presentation/pages/add_new_dream.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteNames.register:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case RouteNames.moreInformation:
        return MaterialPageRoute(builder: (_) => const MoreInformations());
      case RouteNames.onBoarding:
        return MaterialPageRoute(builder: (_) => const onBoarding());
      case RouteNames.addDream:
        return MaterialPageRoute(builder: (_) => const AddDreamScreen());
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const Homescreen());
      case RouteNames.settings:
        return MaterialPageRoute(builder: (_) => const Settings());
      case RouteNames.journal:
        return MaterialPageRoute(builder: (_) => const Journal());
      case RouteNames.profile:
        return MaterialPageRoute(builder: (_) => const Profile());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Aucune route pour ${settings.name}')),
          ),
        );
    }
  }
}
