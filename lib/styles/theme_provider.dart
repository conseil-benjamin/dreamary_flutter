import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system);

  void toggleTheme() {
    if (state == ThemeMode.dark) {
      state = ThemeMode.light;
    } else {
      state = ThemeMode.dark;
    }
    Future<void> _storeTheme() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('theme', state.toString());
    }
  }

  void setTheme(ThemeMode mode) {
    state = mode;
  }
}

final themeNotifierProvider =
StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) => ThemeNotifier());