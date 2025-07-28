import 'package:dreamary_flutter/features/auth/presentation/pages/login_screen.dart';
import 'package:dreamary_flutter/features/splashScreen/splashScreen.dart';
import 'package:dreamary_flutter/routes/app_routes.dart';
import 'package:dreamary_flutter/styles/theme_provider.dart';
import 'package:dreamary_flutter/styles/themesData.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);

    return MaterialApp(
      title: 'Dreamary',
      onGenerateRoute: AppRoutes.generateRoute,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      home: const SplashScreen(),
    );
  }
}
