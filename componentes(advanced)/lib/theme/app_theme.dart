import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.blue;
  static const Color secondary = Colors.black;
  static const Color primaryDark = Colors.red;
  static const Color secondaryDark = Colors.blue;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: primary,
      appBarTheme: const AppBarTheme(
        backgroundColor: primary,
        elevation: 0,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: primary),
      ),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: primary),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: Colors.blue, shape: const StadiumBorder(), elevation: 0),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: primary),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10))),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10))),
      ));

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: primaryDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryDark,
        elevation: 0,
      ),
      scaffoldBackgroundColor: secondary,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: primaryDark)),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: primaryDark),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: Colors.red, shape: const StadiumBorder(), elevation: 0),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: primaryDark),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryDark),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryDark),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10))),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10))),
      ));
}
