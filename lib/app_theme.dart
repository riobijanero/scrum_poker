import 'dart:math';

import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static int colorShade = 50;

  static List<Color> lightColorsList = [
    Colors.blue[colorShade],
    Colors.red[colorShade],
    Colors.purple[colorShade],
    Colors.yellow[colorShade],
    Colors.green[colorShade]
  ];

  static getRandomColor() {
    final random = Random();
    var i = random.nextInt(lightColorsList.length);
    return lightColorsList[i];
  }

  static Color _lightIconColor = Colors.blueAccent.shade200;
  static Color _darkIconColor = Colors.yellowAccent;

  static Color _lightPrimaryColor = Color(0XFFF5F5F5);
  static const Color _lightPrimaryVariantColor =
      Color(0XFFFAFAFA); // Scaffold background
  static const Color _lightSecondaryColor = Colors.black54;
  static const Color _lightOnPrimaryColor = Colors.black87;

  static const Color _darkPrimaryColor = Colors.black;
  static const Color _darkPrimaryVariantColor =
      Color(0xFF404041); // Scaffold background
  static const Color _darkSecondaryColor = Colors.white70;
  static const Color _darkOnPrimaryColor = Colors.white;

  static final TextStyle _lightScreenHeadingTextStyle =
      TextStyle(fontSize: 48.0, color: _lightOnPrimaryColor);
  static final TextStyle _lightScreenMenuTextStyle =
      TextStyle(fontSize: 18.0, color: _lightOnPrimaryColor);
  static final TextStyle _lightScreenDescriptionTextStyle =
      TextStyle(fontSize: 20.0, color: _lightOnPrimaryColor);
  static final TextStyle _lightScreenSingleCardTextStyle =
      TextStyle(fontSize: 120.0, color: _lightOnPrimaryColor);
  static final TextStyle _lightGridViewCardTextStyle =
      TextStyle(fontSize: 34.0, color: _lightOnPrimaryColor);
  static final TextStyle _lightCardRowViewCardTextStyle =
      TextStyle(fontSize: 20.0, color: _lightIconColor);

  static final TextStyle _darkScreenHeadingTextStyle =
      _lightScreenHeadingTextStyle.copyWith(color: _darkOnPrimaryColor);
  static final TextStyle _darkScreenMenuTextStyle =
      _lightScreenMenuTextStyle.copyWith(color: _darkOnPrimaryColor);
  static final TextStyle _darkScreenSingleCardTextStyle =
      _lightScreenSingleCardTextStyle.copyWith(color: _darkOnPrimaryColor);
  static final TextStyle _darkGridViewCardTextStyle =
      _lightGridViewCardTextStyle.copyWith(color: _darkOnPrimaryColor);
  static final TextStyle _darkCardRowViewCardTextStyle =
      _lightCardRowViewCardTextStyle.copyWith(color: _darkIconColor);
  static final TextStyle _darkScreenDescriptionTextStyle =
      _lightScreenDescriptionTextStyle.copyWith(color: _darkOnPrimaryColor);

  static final TextTheme _lightTextTheme = TextTheme(
    headline5: _lightScreenHeadingTextStyle,
    bodyText2: _lightScreenMenuTextStyle,
    bodyText1: _lightScreenDescriptionTextStyle,
    headline4: _lightScreenSingleCardTextStyle,
    headline3: _lightGridViewCardTextStyle,
    headline6: _lightCardRowViewCardTextStyle,
  );

  static final TextTheme _darkTextTheme = TextTheme(
    headline5: _darkScreenHeadingTextStyle,
    bodyText2: _darkScreenMenuTextStyle,
    headline4: _darkScreenSingleCardTextStyle,
    headline3: _darkGridViewCardTextStyle,
    headline6: _darkCardRowViewCardTextStyle,
    bodyText1: _darkScreenDescriptionTextStyle,
  );

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _lightPrimaryVariantColor,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      iconTheme: IconThemeData(color: _lightOnPrimaryColor),
      textTheme: TextTheme(
        headline6: TextStyle(fontSize: 24, color: _lightOnPrimaryColor),
      ),
    ),
    cardColor: _lightPrimaryColor,
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      primaryVariant: _lightPrimaryVariantColor,
      secondary: _lightSecondaryColor,
      onPrimary: _lightOnPrimaryColor,
      surface: Colors.white,
      // secondaryVariant: null,
      // background: null,
      // error: null,
      // onSecondary: null,
      // onSurface: null,
      // onBackground: null,
      // onError: null,
      // brightness: null,
    ),
    iconTheme: IconThemeData(color: _lightIconColor),
    toggleableActiveColor: _lightOnPrimaryColor,
    textTheme: _lightTextTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: _darkPrimaryVariantColor,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      iconTheme: IconThemeData(color: _darkOnPrimaryColor),
      textTheme: TextTheme(
        headline6: TextStyle(fontSize: 24, color: _darkOnPrimaryColor),
      ),
    ),
    cardColor: _darkPrimaryVariantColor,
    colorScheme: ColorScheme.dark(
      primary: _darkPrimaryColor,
      primaryVariant: _darkPrimaryVariantColor,
      secondary: _darkSecondaryColor,
      onPrimary: _darkOnPrimaryColor,
      surface: Colors.black54,
    ),
    iconTheme: IconThemeData(color: _darkIconColor),
    toggleableActiveColor: _darkIconColor,
    textTheme: _darkTextTheme,
  );
}
