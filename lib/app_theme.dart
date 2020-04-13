import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static Color _iconColor = Colors.blueAccent.shade200;

  static const Color _lightPrimaryColor = Colors.white;
  static const Color _lightPrimaryVariantColor = Color(0XFFFAFAFA); // Scaffold background
  static const Color _lightSecondaryColor = Colors.green;
  static const Color _lightOnPrimaryColor = Colors.black;

  static const Color _darkPrimaryColor = Colors.black;
  static const Color _darkPrimaryVariantColor = Color(0xFF404041); // Scaffold background
  static const Color _darkSecondaryColor = Colors.green;
  static const Color _darkOnPrimaryColor = Colors.white;

  static final TextStyle _lightScreenHeadingTextStyle = TextStyle(fontSize: 48.0, color: _lightOnPrimaryColor);
  static final TextStyle _lightScreenMenuTextStyle = TextStyle(fontSize: 20.0, color: _lightOnPrimaryColor);
  static final TextStyle _lightScreenSingleCardTextStyle = TextStyle(fontSize: 180.0, color: _lightOnPrimaryColor);
  static final TextStyle _lightGridViewCardTextStyle = TextStyle(fontSize: 34.0, color: _lightOnPrimaryColor);

  static final TextStyle _darkScreenHeadingTextStyle =
      _lightScreenHeadingTextStyle.copyWith(color: _darkOnPrimaryColor);
  static final TextStyle _darkScreenMenuTextStyle = _lightScreenMenuTextStyle.copyWith(color: _darkOnPrimaryColor);
  static final TextStyle _darkScreenSingleCardTextStyle =
      _lightScreenSingleCardTextStyle.copyWith(color: _darkOnPrimaryColor);
  static final TextStyle _darkGridViewCardTextStyle = _lightGridViewCardTextStyle.copyWith(color: _darkOnPrimaryColor);

  static final TextTheme _lightTextTheme = TextTheme(
    headline: _lightScreenHeadingTextStyle,
    body1: _lightScreenMenuTextStyle,
    display1: _lightScreenSingleCardTextStyle,
    display2: _lightGridViewCardTextStyle,
  );

  static final TextTheme _darkTextTheme = TextTheme(
    headline: _darkScreenHeadingTextStyle,
    body1: _darkScreenMenuTextStyle,
    display1: _darkScreenSingleCardTextStyle,
    display2: _darkGridViewCardTextStyle,
  );

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _lightPrimaryVariantColor,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      iconTheme: IconThemeData(color: _lightOnPrimaryColor),
      textTheme: TextTheme(
        title: TextStyle(fontSize: 24, color: _lightOnPrimaryColor),
      ),
    ),
    cardColor: _lightPrimaryVariantColor,
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      primaryVariant: _lightPrimaryVariantColor,
      secondary: _lightSecondaryColor,
      // surface: Colors.red,
      // onPrimary: _lightOnPrimaryColor,
      // secondaryVariant: null,
      // background: null,
      // error: null,
      // onSecondary: null,
      // onSurface: null,
      // onBackground: null,
      // onError: null,
      // brightness: null,
    ),
    iconTheme: IconThemeData(color: _iconColor),
    textTheme: _lightTextTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: _darkPrimaryVariantColor,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      iconTheme: IconThemeData(color: _darkOnPrimaryColor),
      textTheme: TextTheme(
        title: TextStyle(fontSize: 24, color: _darkOnPrimaryColor),
      ),
    ),
    cardColor: _darkPrimaryVariantColor,
    colorScheme: ColorScheme.light(
      primary: _darkPrimaryColor,
      primaryVariant: _darkPrimaryVariantColor,
      secondary: _darkSecondaryColor,
    ),
    iconTheme: IconThemeData(color: _iconColor),
    textTheme: _darkTextTheme,
  );
}
