import 'package:flutter/material.dart';
import '../constants/constants.dart';

class WishPoolThemeProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isLightMode => themeMode == ThemeMode.light;

  set mode(String modeName) {
    themeMode = (modeName == 'light') ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

class WishPoolTheme {
  static final ThemeData appThemeLight = ThemeData(
    primaryColor: primaryColorLightTheme,
    backgroundColor: Colors.transparent,
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w700,
        fontSize: 75,
        color: primaryColorDarkLightTheme,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: primaryColorLightTheme,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        color: Colors.black,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryColorLightTheme),
        elevation: MaterialStateProperty.all(10),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
        ),
      ),
    ),
    primaryIconTheme: const IconThemeData(color: primaryColorDarkLightTheme),
    inputDecorationTheme: const InputDecorationTheme(
      iconColor: primaryColorLightTheme,
      // border: InputBorder(),
    ),
  );

  static final ThemeData appThemeDark = ThemeData(
    primaryColor: primaryColorDarkTheme,
    backgroundColor: Colors.transparent,
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w700,
        fontSize: 75,
        color: primaryColorLightDarkTheme,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w400,
        color: Color(0xFFBADBF6),
      ),
      labelMedium: TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: primaryColorDarkTheme,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        color: Color(0xFFBADBF6),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryColorDarkTheme),
        elevation: MaterialStateProperty.all(10),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
        ),
      ),
    ),
    primaryIconTheme: const IconThemeData(color: primaryColorLightDarkTheme),
    inputDecorationTheme: const InputDecorationTheme(
      iconColor: primaryColorDarkTheme,
      // border: InputBorder(),
    ),
  );
}
