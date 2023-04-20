import 'package:bloc/bloc.dart';

import 'package:kib_task/features/settings/domain/entities/app_theme_mode.dart';
import 'package:kib_task/features/settings/presentation/bloc/theme_mode_event.dart';

class ThemeModeBloc extends Bloc<ThemeModeEvent, AppThemeMode> {
  ThemeModeBloc() : super(AppThemeMode()) {
    on<ChangeThemeModeEvent>(
      (event, emit) async {
        emit(AppThemeMode(isDark: event.isDark));
      },
    );
  }
}
