import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum AppThemePreference { system, light, dark }

extension AppThemePreferenceX on AppThemePreference {
  String get storageValue => name;

  ThemeMode get themeMode => switch (this) {
    AppThemePreference.system => ThemeMode.system,
    AppThemePreference.light => ThemeMode.light,
    AppThemePreference.dark => ThemeMode.dark,
  };

  static AppThemePreference fromStorage(String? value) {
    return switch (value) {
      'light' => AppThemePreference.light,
      'dark' => AppThemePreference.dark,
      _ => AppThemePreference.system,
    };
  }
}

class AppSettings extends Equatable {
  const AppSettings({required this.themePreference, required this.localeCode});

  const AppSettings.initial()
    : themePreference = AppThemePreference.system,
      localeCode = 'ru';

  final AppThemePreference themePreference;
  final String localeCode;

  ThemeMode get themeMode => themePreference.themeMode;

  @override
  List<Object?> get props => <Object?>[themePreference, localeCode];
}
