import 'package:flutter/material.dart';
import 'package:wish_pool/screens/auth/log_in.dart';
import 'package:wish_pool/screens/auth/sign_up.dart';

class Auth extends StatefulWidget {
  static const routeName = '/auth';
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool isLogin = true;

  void toggle() => setState(() {
        isLogin = !isLogin;
      });

  @override
  Widget build(BuildContext context) =>
      isLogin ? LogIn(toggle) : SignUp(toggle);
}
