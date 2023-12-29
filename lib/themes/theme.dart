import 'package:flutter/material.dart';

import '../constants/constants.dart' as app_constants;

class WishPoolTheme {
  static final ThemeData appThemeLight = ThemeData(
    primaryColor: const Color(0xFF373064),
    // scaffoldBackgroundColor: const Color(0xFFC6A1AC),
    scaffoldBackgroundColor: const Color(0xFFE1DFEC),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w700,
        color: Color(0xFF373064),
      ),
      titleLarge: TextStyle(
        fontFamily: 'Nunito-Bold',
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
        color: Colors.blueGrey,
      ),
    ),
    appBarTheme: const AppBarTheme(
      // backgroundColor: Color(0xFF373064),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0.0,
      foregroundColor: Color(0xFF373064),
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
    primaryColor: const Color(0xFF024A82),
    scaffoldBackgroundColor: const Color(0xFF030110),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w700,
        color: Color(0xFFC5BFE8),
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
        color: Colors.grey,
      ),
    ),
    appBarTheme: const AppBarTheme(
      // backgroundColor: Color(0xFF030110),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0.0,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(255, 38, 31, 85)),
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
        side: MaterialStateProperty.all(
          const BorderSide(
            color: Color.fromARGB(255, 22, 18, 50),
          ),
        ),
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
