import 'package:flutter/material.dart';
import 'package:kib_task/features/currency_convertor/presentation/screens/currency_convertor.dart';
import 'package:kib_task/features/splash/presentation/splash.dart';

final routes = <String, WidgetBuilder>{
  SplashScreen.routeName: (BuildContext context) => const SplashScreen(),
  CurrencyConvertorPage.routeName: (BuildContext context) =>
      const CurrencyConvertorPage(),
};
