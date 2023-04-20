import 'package:flutter/material.dart';
import 'package:kib_task/features/currency_convertor/presentation/screens/currency_convertor.dart';
import 'package:kib_task/features/settings/presentation/screens/settings.dart';
import 'package:kib_task/features/splash/presentation/splash.dart';

final routes = <String, WidgetBuilder>{
  SplashScreen.routeName: (BuildContext context) => const SplashScreen(),
  CurrencyConvertorScreen.routeName: (BuildContext context) =>
      const CurrencyConvertorScreen(),
  SettingsScreen.routeName: (BuildContext context) => const SettingsScreen(),
};
