import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kib_task/features/base/presentation/bloc/base_bloc_event.dart';
part 'theme_mode_event.freezed.dart';

abstract class ThemeModeEvent extends BaseBlocEvent {
  const ThemeModeEvent();
}

@freezed
class ChangeThemeModeEvent extends ThemeModeEvent with _$ChangeThemeModeEvent {
  const factory ChangeThemeModeEvent({bool? isDark}) =
      _ChangeThemeModeEventEvent;
}
