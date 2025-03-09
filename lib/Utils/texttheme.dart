import 'package:flutter/material.dart';
import 'package:shahabfit/Constants/colors.dart';

TextTheme customTextTheme = const TextTheme(
  displayLarge: anjomanBlack,
  displayMedium: anjomanBold,
  displaySmall: anjomanExtraBold,
  bodyLarge: anjomanRegular,
  bodyMedium: anjomanExtraLight,
  bodySmall: anjomanLight,
  titleLarge: anjomanRegular,
  titleMedium: anjomanSemiBold,
  labelSmall: anjomanMedium,
);

extension UIThemeExtension on BuildContext {
  TextStyle get anjomanBlack => customTextTheme.displayLarge!;
  TextStyle get anjomanBold => customTextTheme.displayMedium!;
  TextStyle get anjomanExtraBold => customTextTheme.displaySmall!;
  TextStyle get anjomanUltraBold => customTextTheme.bodyLarge!;
  TextStyle get anjomanExtraLight => customTextTheme.bodyMedium!;
  TextStyle get anjomanLight => customTextTheme.bodySmall!;
  TextStyle get anjomanRegular => customTextTheme.titleLarge!;
  TextStyle get anjomanSemiBold => customTextTheme.titleMedium!;
  TextStyle get anjomanMedium => customTextTheme.labelSmall!;
}

const anjomanBlack =
    TextStyle(fontFamily: 'Anjoman-Black', fontSize: 16, color: textColor);
const anjomanBold =
    TextStyle(fontFamily: 'Anjoman-Bold', fontSize: 14, color: textColor);
const anjomanExtraBold =
    TextStyle(fontFamily: 'Anjoman-ExtraBold', fontSize: 14, color: textColor);
const anjomanUltraBold =
    TextStyle(fontFamily: 'Anjoman-UltraBold', fontSize: 16, color: textColor);
const anjomanExtraLight =
    TextStyle(fontFamily: 'Anjoman-ExtraLight', fontSize: 14, color: textColor);
const anjomanLight =
    TextStyle(fontFamily: 'Anjoman-Light', fontSize: 14, color: textColor);
const anjomanRegular =
    TextStyle(fontFamily: 'Anjoman-Regular', fontSize: 16, color: textColor);
const anjomanSemiBold =
    TextStyle(fontFamily: 'Anjoman-SemiBold', fontSize: 14, color: textColor);
const anjomanMedium =
    TextStyle(fontFamily: 'Anjoman-Medium', fontSize: 14, color: textColor);
