import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wish_pool/app.dart';
import 'package:email_validator/email_validator.dart';
import 'package:wish_pool/utility/utils.dart';
import 'package:wish_pool/widgets/auth_box.dart';

import '../../models/wisher.dart';

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
      Provider.of<Wisher>(context, listen: false).addWisher(
        wisherId: wisher.user!.uid,
        wisherName: wisher.user!.email as String,
      );
    }

    Future<void> signUp() async {
      bool isValid = _formKey.currentState!.validate();
      if (!isValid) return;

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

    // return AppBackground(
    //   child: Scaffold(
    return Scaffold(
      body: Center(
        child: AuthBox(
          child: Padding(
            padding: const EdgeInsets.all(12),
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
                    decoration: InputDecoration(
                      icon: const Icon(Icons.lock),
                      iconColor:
                          Theme.of(context).inputDecorationTheme.iconColor,
                      border: Theme.of(context).inputDecorationTheme.border,
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
                    onPressed: signUp,
                    child: Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.labelMedium!,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.black,
                          ),
                      text: "Already registered?  ",
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = logIn,
                          text: "Log In",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
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
      // ),
    );
  }
}
