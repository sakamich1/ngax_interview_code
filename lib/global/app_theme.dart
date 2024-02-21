/*
 * @Author: your name
 * @Date: 2020-12-08 20:57:12
 * @LastEditTime: 2020-12-09 22:30:22
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/theme/app_theme.dart
 */
import 'package:flutter/material.dart';

const kPrimaryColor = const Color(0xFFc44dff);
const kPrimaryLightColor = const Color(0xFFf0d3ff);
const primaryDarkColor = const Color(0xFF8936b3);
const secondaryColor = const Color(0xFFe1a6ff);
const secondaryLightColor = const Color(0xFFe1a6ff);
const secondaryDarkColor = const Color(0xFFe1a6ff);
// const primaryTextColor = const Color(0xFFF1E6FF);
// const secondaryTextColor = const Color(0xFFF1E6FF);

ThemeData get appThemeData => ThemeData(
    primaryColor: kPrimaryColor,
    primaryColorLight: kPrimaryLightColor,
    scaffoldBackgroundColor: Colors.white,
    accentColor: kPrimaryColor,
    appBarTheme: appBarTheme,
    brightness: Brightness.light
    /*textTheme: GoogleFonts.poppinsTextTheme()*/);

ThemeData get darkThemeData => ThemeData(
    primaryColor: kPrimaryColor,
    primaryColorLight: kPrimaryLightColor,
    scaffoldBackgroundColor: Colors.white,
    accentColor: kPrimaryColor,
    appBarTheme: appBarTheme,
    brightness: Brightness.dark
);

AppBarTheme get appBarTheme => AppBarTheme();
