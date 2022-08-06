import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_pool/themes/theme.dart';
import '../constants/constants.dart' as app_constants;
import '../models/wisher.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  const AppBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<WishPoolThemeProvider>(context).themeMode ==
              ThemeMode.dark
          ? app_constants.gradientBackground1DarkTheme
          : null,
      decoration: Provider.of<WishPoolThemeProvider>(context).themeMode ==
              ThemeMode.light
          ? const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    app_constants.gradientBackground1LightTheme,
                    app_constants.gradientBackground2LightTheme,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.5,
                    0.6,
                  ]),
            )
          : null,
      child: child,
    );
  }
}
