import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'package:wish_pool/app.dart';
import 'package:wish_pool/screens/auth/forgot_password.dart';
import 'package:wish_pool/utility/utils.dart';
import 'package:wish_pool/widgets/app_background.dart';
import 'package:wish_pool/widgets/auth_box.dart';

class LogIn extends StatelessWidget {
  final VoidCallback signUp;

  static const routeName = '/log_in';
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LogIn(this.signUp, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _logIn() async {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        Utils.showSnackBar(e.message);
      }

      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    return AppBackground(
      child: Scaffold(
        body: Center(
          child: AuthBox(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.person),
                        iconColor:
                            Theme.of(context).inputDecorationTheme.iconColor,
                        border: Theme.of(context).inputDecorationTheme.border,
                        labelText: "Email",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.lock),
                        iconColor:
                            Theme.of(context).inputDecorationTheme.iconColor,
                        border: Theme.of(context).inputDecorationTheme.border,
                        labelText: "Password",
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: _logIn,
                      child: Text(
                        "Log In",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      child: Text(
                        "Forgot Password?",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                      ),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ForgotPassword())),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    RichText(
                      text: TextSpan(
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.black,
                                ),
                        text: "Register?  ",
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = signUp,
                            text: "Sign Up",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
