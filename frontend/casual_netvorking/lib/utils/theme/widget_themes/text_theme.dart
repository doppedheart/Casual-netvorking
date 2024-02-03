import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colors.dart';

/// Custom Class for Light & Dark Text Themes
class TTextTheme {
  TTextTheme._(); // To avoid creating instances

  static const fontStyle = GoogleFonts.poppins;

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
      displayLarge: fontStyle(
          fontSize: 80.0, fontWeight: FontWeight.bold, color: TColors.dark),
      displayMedium: fontStyle(
          fontSize: 64.0, fontWeight: FontWeight.w600, color: TColors.dark),
      displaySmall: fontStyle(
          fontSize: 48.0, fontWeight: FontWeight.w600, color: TColors.dark),
      headlineLarge: fontStyle(
          fontSize: 32.0, fontWeight: FontWeight.bold, color: TColors.dark),
      headlineMedium: fontStyle(
          fontSize: 24.0, fontWeight: FontWeight.w600, color: TColors.dark),
      headlineSmall: fontStyle(
          fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.dark),
      titleLarge: fontStyle(
          fontSize: 16.0, fontWeight: FontWeight.w600, color: TColors.dark),
      titleMedium: fontStyle(
          fontSize: 16.0, fontWeight: FontWeight.w500, color: TColors.dark),
      titleSmall: fontStyle(
          fontSize: 16.0, fontWeight: FontWeight.w400, color: TColors.dark),
      bodyLarge: fontStyle(
          fontSize: 14.0, fontWeight: FontWeight.w500, color: TColors.dark),
      bodyMedium: fontStyle(
          fontSize: 14.0, fontWeight: FontWeight.normal, color: TColors.dark),
      bodySmall: fontStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: TColors.dark.withOpacity(0.5)),
      labelLarge: fontStyle(
          fontSize: 12.0, fontWeight: FontWeight.normal, color: TColors.dark),
      labelMedium: fontStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          color: TColors.dark.withOpacity(0.5)));

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
      displayLarge: fontStyle(
          fontSize: 80.0, fontWeight: FontWeight.bold, color: TColors.light),
      displayMedium: fontStyle(
          fontSize: 64.0, fontWeight: FontWeight.w600, color: TColors.light),
      displaySmall: fontStyle(
          fontSize: 48.0, fontWeight: FontWeight.w600, color: TColors.light),
      headlineLarge: fontStyle(
          fontSize: 32.0, fontWeight: FontWeight.bold, color: TColors.light),
      headlineMedium: fontStyle(
          fontSize: 24.0, fontWeight: FontWeight.w600, color: TColors.light),
      headlineSmall: fontStyle(
          fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.light),
      titleLarge: fontStyle(
          fontSize: 16.0, fontWeight: FontWeight.w600, color: TColors.light),
      titleMedium: fontStyle(
          fontSize: 16.0, fontWeight: FontWeight.w500, color: TColors.light),
      titleSmall: fontStyle(
          fontSize: 16.0, fontWeight: FontWeight.w400, color: TColors.light),
      bodyLarge: fontStyle(
          fontSize: 14.0, fontWeight: FontWeight.w500, color: TColors.light),
      bodyMedium: fontStyle(
          fontSize: 14.0, fontWeight: FontWeight.normal, color: TColors.light),
      bodySmall: fontStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: TColors.light.withOpacity(0.5)),
      labelLarge: fontStyle(
          fontSize: 12.0, fontWeight: FontWeight.normal, color: TColors.light),
      labelMedium: fontStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          color: TColors.light.withOpacity(0.5)));
}
