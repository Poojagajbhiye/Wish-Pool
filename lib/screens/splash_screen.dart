import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF845B29),
      child: Center(
        child: Image.asset(
          "assets/wp_logo.png",
          width: 180,
          height: 180,
        ),
      ),
    );
  }
}
