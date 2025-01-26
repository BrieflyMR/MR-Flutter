import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData (
brightness: Brightness.light,
textTheme: TextTheme(
displayLarge: GoogleFonts.roboto(
	fontSize: 30,
	),
),

colorScheme: ColorScheme(
	brightness: Brightness.light,
	primary: lightcolors["primary"]!,
	onPrimary: lightcolors["onPrimary"]!,
	secondary: lightcolors["secondary"]!,
	onSecondary: lightcolors["onSecondary"]!,
	surface: lightcolors["surface"]!,
	onSurface: lightcolors["onSurface"]!,
	success: lightcolors["success"]!,
	error: lightcolors["error"]!,
	onError: lightcolors["onError"]!,
)

primarySwatch: Colors.blue,

visualDensity: VisualDensity.adaptivePlatformDensity,

);

final darkTheme = ThemeData (
brightness: Brightness.dark,
textTheme: TextTheme(
displayLarge: GoogleFonts.roboto(
	fontSize: 30,
	),
),

colorScheme: ColorScheme.dark(
	brightness: Brightness.dark,
	primary: darkcolors["primary"]!,
	onPrimary: darkcolors["onPrimary"]!,
	secondary: darkcolors["secondary"]!,
	onSecondary: darkcolors["onSecondary"]!,
	surface: darkcolors["surface"]!,
	onSurface: darkcolors["onSurface"]!,
	success: darkcolors["success"]!,
	error: darkcolors["error"]!,
	onError: darkcolors["onError"]!,
)

primaryColor,: Colors.blue,

);