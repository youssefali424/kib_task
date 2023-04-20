import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/language/index.dart';
import 'features/splash/presentation/splash.dart';
import 'routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Translations.appName,
      theme: ThemeData(primarySwatch: Colors.blue, appBarTheme: const AppBarTheme(centerTitle: true)),
      routes: routes,
      initialRoute: SplashScreen.routeName,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
