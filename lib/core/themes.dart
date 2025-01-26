import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: TextTheme(
    displayLarge: GoogleFonts.roboto(
      fontSize: 30,
    ),
  ),
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: lightColors["primary"]!,
    onPrimary: lightColors["onPrimary"]!,
    secondary: lightColors["secondary"]!,
    onSecondary: lightColors["onSecondary"]!,
    surface: lightColors["surface"]!,
    onSurface: lightColors["onSurface"]!,
    error: lightColors["error"]!,
    onError: lightColors["onError"]!,
    background: Colors.white,
    onBackground: Colors.black,
  ),
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme: TextTheme(
    displayLarge: GoogleFonts.roboto(
      fontSize: 30,
    ),
  ),
  colorScheme: ColorScheme.dark(
    primary: darkColors["primary"]!,
    onPrimary: darkColors["onPrimary"]!,
    secondary: darkColors["secondary"]!,
    onSecondary: darkColors["onSecondary"]!,
    surface: darkColors["surface"]!,
    onSurface: darkColors["onSurface"]!,
    error: darkColors["error"]!,
    onError: darkColors["onError"]!,
  ),
  primaryColor: Colors.blue,
);
