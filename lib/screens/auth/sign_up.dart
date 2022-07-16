import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:wish_pool/app.dart';
import 'package:email_validator/email_validator.dart';
import 'package:wish_pool/models/wisher.dart';
import 'package:wish_pool/utility/utils.dart';

class SignUp extends StatelessWidget {
  final VoidCallback logIn;

  static const routeName = '/sign_up';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  SignUp(this.logIn, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void addWisher(wisher) {
      Provider.of<Wisher>(context, listen: false)
          .createWisher(wisher.user!.uid, wisher.user!.email as String);
    }

    Future<void> _signUp() async {
      bool isValid = _formKey.currentState!.validate();
      if (!isValid) return;

      // _formKey.currentState!.save();

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      try {
        final resp = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        addWisher(resp);
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? "Enter a valid mail id."
                      : null,
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => value != null && value.length < 6
                  ? "Password should have more than 6 characters."
                  : null,
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: _signUp,
              child: const Text("Sign Up"),
            ),
            const SizedBox(
              height: 40,
            ),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                text: "Already registered?  ",
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = logIn,
                    text: "Log In",
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
