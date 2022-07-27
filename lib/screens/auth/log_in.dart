import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wish_pool/app.dart';
import 'package:wish_pool/screens/auth/forgot_password.dart';
import 'package:wish_pool/utility/utils.dart';

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

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                icon: Icon(Icons.star_border),
                iconColor: Colors.amber,
                border: InputBorder.none,
                labelText: "Email",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                icon: Icon(Icons.note),
                iconColor: Colors.amber,
                border: InputBorder.none,
                labelText: "Password",
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: _logIn,
              child: const Text("Log In"),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ForgotPassword())),
            ),
            const SizedBox(
              height: 40,
            ),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                text: "Register?  ",
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = signUp,
                    text: "Sign Up",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
