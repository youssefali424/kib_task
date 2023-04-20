import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kib_task/core/di/settings_di.dart';

import 'core/language/index.dart';
import 'features/splash/presentation/splash.dart';
import 'routes/app_routes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp(
      title: Translations.appName,
      theme: ThemeData(
          colorSchemeSeed: const Color(0xFF001B3E),
          appBarTheme: const AppBarTheme(centerTitle: true)),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          colorSchemeSeed: const Color(0xFF001B3E),
          appBarTheme: const AppBarTheme(centerTitle: true)),
      themeMode: ref.watch(themeModeBlocProvider).themeMode,
      routes: routes,
      initialRoute: SplashScreen.routeName,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
