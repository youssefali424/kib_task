import 'package:flutter/material.dart';
import 'package:kib_task/features/currency_convertor/presentation/screens/currency_convertor.dart';
import 'package:kib_task/features/settings/presentation/screens/settings.dart';
import 'package:kib_task/features/splash/presentation/splash.dart';

import '../features/history/presentation/screens/history.dart';

/// const constructor doesn't update the state
/// for translation change
final routes = <String, WidgetBuilder>{
  SplashScreen.routeName: (BuildContext context) => const SplashScreen(),
  CurrencyConvertorScreen.routeName: (BuildContext context) =>
      // ignore: prefer_const_constructors
      CurrencyConvertorScreen(),
  SettingsScreen.routeName: (BuildContext context) => const SettingsScreen(),
  // ignore: prefer_const_constructors
  HistoryScreen.routeName: (BuildContext context) => HistoryScreen(),
};
