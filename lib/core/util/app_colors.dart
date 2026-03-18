import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color transparent = Colors.transparent;
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  static const Color seed = Color(0xFFB35C42);

  static const Color lightPrimary = Color(0xFFAF5C41);
  static const Color darkPrimary = Color(0xFFFFBC9A);

  static const Color lightSecondary = Color(0xFF2E6E64);
  static const Color darkSecondary = Color(0xFF7FD2C1);

  static const Color lightTertiary = Color(0xFF885A79);
  static const Color darkTertiary = Color(0xFFE2B6D5);

  static const Color lightSurface = Color(0xFFFFFBF7);
  static const Color darkSurface = Color(0xFF171C24);

  static const Color lightSurfaceContainerHighest = Color(0xFFF3EDE5);
  static const Color darkSurfaceContainerHighest = Color(0xFF232A35);

  static const Color lightOutlineVariant = Color(0xFFD8CABC);
  static const Color darkOutlineVariant = Color(0xFF46505C);

  static const List<Color> _darkBackdropGradient = <Color>[
    Color(0xFF0F141B),
    Color(0xFF1B2430),
    Color(0xFF152825),
  ];

  static const List<Color> _lightBackdropGradient = <Color>[
    Color(0xFFF8EEDF),
    Color(0xFFE4F0E7),
    Color(0xFFF4E4EE),
  ];

  static const Color _darkPrimaryOrb = Color(0xFFAF5C41);
  static const Color _lightPrimaryOrb = Color(0xFFEAB18D);

  static const Color _darkSecondaryOrb = Color(0xFF2E6E64);
  static const Color _lightSecondaryOrb = Color(0xFFA8D7CB);

  static const Color _darkTertiaryOrb = Color(0xFF885A79);
  static const Color _lightTertiaryOrb = Color(0xFFE6BCD6);

  static Color primary(bool isDark) => isDark ? darkPrimary : lightPrimary;

  static Color secondary(bool isDark) =>
      isDark ? darkSecondary : lightSecondary;

  static Color tertiary(bool isDark) => isDark ? darkTertiary : lightTertiary;

  static Color surface(bool isDark) => isDark ? darkSurface : lightSurface;

  static Color surfaceContainerHighest(bool isDark) =>
      isDark ? darkSurfaceContainerHighest : lightSurfaceContainerHighest;

  static Color outlineVariant(bool isDark) =>
      isDark ? darkOutlineVariant : lightOutlineVariant;

  static List<Color> backdropGradient(bool isDark) =>
      isDark ? _darkBackdropGradient : _lightBackdropGradient;

  static Color primaryOrb(bool isDark) =>
      isDark ? _darkPrimaryOrb : _lightPrimaryOrb;

  static Color secondaryOrb(bool isDark) =>
      isDark ? _darkSecondaryOrb : _lightSecondaryOrb;

  static Color tertiaryOrb(bool isDark) =>
      isDark ? _darkTertiaryOrb : _lightTertiaryOrb;
}
