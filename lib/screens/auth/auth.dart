import 'package:flutter/material.dart';
import 'package:wish_pool/screens/auth/sign_in.dart';
import 'package:wish_pool/screens/auth/sign_up.dart';

class Auth extends StatefulWidget {
  static const routeName = '/auth';
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool isLogin = true;

  void toggle() => setState(() {
        isLogin = !isLogin;
      });

  // @override
  // Widget build(BuildContext context) =>
  //     isLogin ? SignIn(toggle) : SignUp(toggle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/intro_screen_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: isLogin ? SignIn(toggle) : SignUp(toggle),
        ),
      ),
    );
  }
}
