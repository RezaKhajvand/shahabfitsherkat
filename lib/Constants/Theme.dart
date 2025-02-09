import 'package:flutter/material.dart';
import 'package:shahabfit/Constants/BorderRadius.dart';
import 'package:shahabfit/Constants/Font.dart';
import 'package:shahabfit/Constants/colors.dart';

ThemeData getTheme({required bool isFirstTheme}) {
  var primaryColor = isFirstTheme ? primary : secendary;
  return ThemeData(
    drawerTheme: const DrawerThemeData(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    tabBarTheme: TabBarTheme(
      dividerColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator:
          BoxDecoration(borderRadius: tabBorderRadius, color: primaryColor),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: primaryColor)),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white, backgroundColor: Colors.transparent),
    switchTheme: SwitchThemeData(
      thumbColor:
          WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return background;
        }
        return Colors.white;
      }),
      trackColor:
          WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return primaryColor;
        }
        return Colors.white10;
      }),
    ),
    textTheme: const TextTheme(
      //AppBar title
      titleLarge: TextStyle(
          fontFamily: primaryFont,
          fontSize: 16,
          letterSpacing: 0,
          fontWeight: FontWeight.bold),
      //Button
      labelLarge: TextStyle(
          fontFamily: primaryFont,
          fontSize: 16,
          letterSpacing: 0,
          fontWeight: FontWeight.w500),
      labelMedium: TextStyle(
        fontSize: 14,
        letterSpacing: 0,
        fontFamily: primaryFont,
        fontWeight: FontWeight.w600,
      ),
      labelSmall: TextStyle(
        color: Colors.white,
        fontFamily: primaryFont,
        fontSize: 14,
        letterSpacing: 0,
        fontWeight: FontWeight.w300,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontFamily: primaryFont,
        fontSize: 12,
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    chipTheme: ChipThemeData(
        selectedColor: primaryColor,
        labelStyle:
            const TextStyle(fontFamily: primaryFont, color: background)),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: cardBorderRadius),
            side: BorderSide(color: primaryColor),
            foregroundColor: primaryColor)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: cardBorderRadius),
      backgroundColor: primaryColor,
      foregroundColor: background,
    )),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.5),
          letterSpacing: 0,
          fontSize: 14,
          fontWeight: FontWeight.w400),
      floatingLabelStyle:
          TextStyle(color: primaryColor, fontSize: 16, height: 0.1),
      labelStyle: TextStyle(
          color: Colors.white.withOpacity(0.5),
          letterSpacing: 0,
          fontSize: 16,
          fontWeight: FontWeight.w400),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      border: OutlineInputBorder(
        borderRadius: cardBorderRadius,
        borderSide: const BorderSide(color: primary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: cardBorderRadius,
        borderSide: const BorderSide(color: primary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: cardBorderRadius,
        borderSide: const BorderSide(color: primary),
      ),
    ),
    fontFamily: primaryFont,
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    useMaterial3: true,
  );
}
