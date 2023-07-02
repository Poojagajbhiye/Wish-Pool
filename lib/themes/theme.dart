import 'package:flutter/material.dart';

import '../constants/constants.dart' as app_constants;

class WishPoolTheme {
  static final ThemeData appThemeLight = ThemeData(
    primaryColor: const Color(0xFF373064),
    scaffoldBackgroundColor: const Color(0xFFC6A1AC),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w700,
        fontSize: 75,
        color: Color(0xFF373064),
      ),
      titleLarge: TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        color: Colors.white,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF373064),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color(0xFF373064)),
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
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF373064),
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
    primaryIconTheme: const IconThemeData(color: Color(0xFF373064)),
    inputDecorationTheme: const InputDecorationTheme(
      iconColor: Color(0xFF373064),
    ),
  );

  static final ThemeData appThemeDark = ThemeData(
    primaryColor: const Color(0xFF030110),
    scaffoldBackgroundColor: const Color(0xFF030110),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w700,
        fontSize: 75,
        color: Color(0xFF030110),
      ),
      titleLarge: TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        color: Colors.grey,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF030110),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color(0xFF030110)),
        elevation: MaterialStateProperty.all(5),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF030110),
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
    primaryIconTheme:
        const IconThemeData(color: app_constants.primaryColorLightDarkTheme),
    inputDecorationTheme: const InputDecorationTheme(
      iconColor: app_constants.primaryColorDarkTheme,
    ),
  );
}

class WishPoolThemeProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isLightMode => themeMode == ThemeMode.light;

  set mode(String modeName) {
    themeMode = (modeName == 'light') ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
