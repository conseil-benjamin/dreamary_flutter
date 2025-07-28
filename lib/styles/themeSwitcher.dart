import 'package:dreamary_flutter/styles/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeSwitcher extends ConsumerWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);
    final isDark = themeMode == ThemeMode.dark;

    return SwitchListTile(
      title: Text('Mode sombre'),
      value: isDark,
      onChanged: (_) => ref.read(themeNotifierProvider.notifier).toggleTheme(),
    );
  }
}