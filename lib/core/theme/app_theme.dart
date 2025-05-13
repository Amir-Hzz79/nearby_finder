import 'package:flutter/material.dart';

class AppTheme {
  static final ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF0066CC),
    onPrimary: Colors.white,
    primaryContainer: Color(0xFFCCE4FF),
    onPrimaryContainer: Color(0xFF003366),
    secondary: Color(0xFF009688),
    onSecondary: Colors.white,
    secondaryContainer: Color(0xFFB2DFDB),
    onSecondaryContainer: Color(0xFF004D40),
    tertiary: Color(0xFFFF9800),
    onTertiary: Colors.white,
    tertiaryContainer: Color(0xFFFFE0B2),
    onTertiaryContainer: Color(0xFFEF6C00),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF1A1C1E),
    onSurfaceVariant: Color(0xFF4A4A4A),
    surfaceContainer: Color(0xFFF4F4F4),
    outline: Color(0xFFB0BEC5),
    error: Color(0xFFD32F2F),
    onError: Colors.white,
    errorContainer: Color(0xFFFFDAD4),
    onErrorContainer: Color(0xFF410002),
    inverseSurface: Color(0xFF2E2E2E),
    onInverseSurface: Color(0xFFF5F5F5),
    inversePrimary: Color(0xFF82B1FF),
    shadow: Colors.black,
    scrim: Colors.black54,
    surfaceTint: Color(0xFF0066CC),
  );

  static final ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF3399FF),
    onPrimary: Colors.black,
    primaryContainer: Color(0xFF003366),
    onPrimaryContainer: Color(0xFFCCE4FF),
    secondary: Color(0xFF4DB6AC),
    onSecondary: Colors.black,
    secondaryContainer: Color(0xFF004D40),
    onSecondaryContainer: Color(0xFFB2DFDB),
    tertiary: Color(0xFFFFB74D),
    onTertiary: Colors.black,
    tertiaryContainer: Color(0xFFEF6C00),
    onTertiaryContainer: Color(0xFFFFE0B2),
    surface: Color(0xFF121212),
    onSurface: Color(0xFFE0E0E0),
    onSurfaceVariant: Color(0xFFBDBDBD),
    surfaceContainer: Color(0xFF1E1E1E),
    outline: Color(0xFF90A4AE),
    error: Color(0xFFEF9A9A),
    onError: Colors.black,
    errorContainer: Color(0xFFD32F2F),
    onErrorContainer: Color(0xFFFFDAD4),
    inverseSurface: Color(0xFFE0E0E0),
    onInverseSurface: Color(0xFF303030),
    inversePrimary: Color(0xFF003366),
    shadow: Colors.black,
    scrim: Colors.black54,
    surfaceTint: Color(0xFF3399FF),
  );

  static final InputDecorationTheme inputTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: darkColorScheme.primary),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    useMaterial3: true,
    inputDecorationTheme: inputTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    useMaterial3: true,
    inputDecorationTheme: inputTheme,
  );
}
