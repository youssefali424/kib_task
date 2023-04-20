import 'package:kib_task/features/settings/domain/entities/app_theme_mode.dart';
import 'package:kib_task/features/settings/presentation/bloc/theme_mode_bloc.dart';
import 'package:riverbloc/riverbloc.dart';

final themeModeBlocProvider =
    BlocProvider<ThemeModeBloc, AppThemeMode>(
  (ref) => ThemeModeBloc(),
);
