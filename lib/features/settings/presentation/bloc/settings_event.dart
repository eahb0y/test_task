import 'package:equatable/equatable.dart';

import '../../domain/entities/app_settings.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => <Object?>[];
}

class SettingsStarted extends SettingsEvent {
  const SettingsStarted();
}

class ThemePreferenceChanged extends SettingsEvent {
  const ThemePreferenceChanged(this.themePreference);

  final AppThemePreference themePreference;

  @override
  List<Object?> get props => <Object?>[themePreference];
}

class LocalePreferenceChanged extends SettingsEvent {
  const LocalePreferenceChanged(this.localeCode);

  final String localeCode;

  @override
  List<Object?> get props => <Object?>[localeCode];
}
