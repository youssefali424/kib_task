import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kib_task/core/language/index.dart';
import 'package:kib_task/core/language/supported.dart';
import 'package:kib_task/features/settings/presentation/bloc/theme_mode_event.dart';

import '../../../../core/di/settings_di.dart';
import '../../../history/presentation/screens/history.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.settings),
      ),
      body: ListView(children: [
        Consumer(builder: (context, ref, _) {
          return ListTile(
            title: Text(Translations.darkMode),
            trailing: Switch(
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (value) {
                ref
                    .read(themeModeBlocProvider.bloc)
                    .add(ChangeThemeModeEvent(isDark: value));
              },
            ),
          );
        }),
        ListTile(
          title: Text(Translations.language),
          trailing: DropdownButton<String>(
            value: context.locale.languageCode,
            items: SupportedLanguage.values
                .map((e) => DropdownMenuItem(
                      value: e.locale.languageCode,
                      child: Text(e.translate),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                context.setLocale(Locale(value));
              }
            },
          ),
        ),
        ListTile(
          title: Text(Translations.history),
          onTap: () {
            Navigator.of(context).pushNamed(HistoryScreen.routeName);
          },
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ]),
    );
  }
}
