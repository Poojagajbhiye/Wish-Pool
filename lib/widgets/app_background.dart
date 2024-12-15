import 'package:flutter/material.dart';
import '../constants/constants.dart' as app_constants;

class AppBackground extends StatelessWidget {
  final Widget child;
  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              app_constants.gradientBackground1LightTheme,
              app_constants.gradientBackground2LightTheme,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.6,
              0.7,
            ]),
      ),
      child: child,
    );
  }
}
