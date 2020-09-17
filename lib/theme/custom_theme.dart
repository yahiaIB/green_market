import './cusom_text_style.dart';
import 'package:flutter/material.dart';
import 'custom_colors.dart';

class CustomTheme {
  //set your theme in MaterialApp
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: CustomColors.primaryColor,
      accentColor: CustomColors.accentColor,
      backgroundColor: Colors.white,
      bottomAppBarColor: Colors.white,
      appBarTheme: AppBarTheme(color: CustomColors.primaryColor),
      textTheme: CustomTextStyle.textThemeLight);

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: CustomColors.accentColor,
      accentColor: CustomColors.primaryColor,
      backgroundColor: Colors.black,
      bottomAppBarColor: CustomColors.accentColorDark,
      appBarTheme: AppBarTheme(color: CustomColors.accentColorLight),
      textTheme: CustomTextStyle.textThemeDark);
}
