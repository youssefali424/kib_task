import 'package:flutter/material.dart';

class AppThemeMode {
  final bool? _isDark;
  ThemeMode get themeMode => (_isDark == null)
      ? ThemeMode.system
      : (_isDark == true)
          ? ThemeMode.dark
          : ThemeMode.light;
  AppThemeMode({bool? isDark}) : _isDark = isDark;
}
