import 'package:flutter/material.dart';
import 'package:shahabfit/Constants/BorderRadius.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/utils/texttheme.dart';

ThemeData getTheme({required bool isFirstTheme}) {
  var primaryColor = isFirstTheme ? primary : secendary;
  return ThemeData(
    drawerTheme: const DrawerThemeData(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    tabBarTheme: TabBarThemeData(
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
    textTheme: customTextTheme,
    iconTheme: const IconThemeData(color: Colors.white),
    chipTheme: ChipThemeData(
        selectedColor: primaryColor,
        labelStyle: anjomanMedium.copyWith(color: background)),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: cardBorderRadius),
            side: BorderSide(color: primaryColor),
            foregroundColor: primaryColor)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: cardBorderRadius),
      backgroundColor: primaryColor,
      foregroundColor: background,
    )),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: anjomanExtraLight.copyWith(
          color: Colors.white.withValues(alpha: 0.5)),
      floatingLabelStyle: anjomanMedium.copyWith(height: 0.1),
      labelStyle:
          anjomanLight.copyWith(color: Colors.white.withValues(alpha: 0.5)),
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
    fontFamily: anjomanLight.fontFamily,
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    useMaterial3: true,
  );
}
