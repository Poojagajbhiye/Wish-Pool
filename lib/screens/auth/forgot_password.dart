import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wish_pool/app.dart';
import 'package:wish_pool/utility/utils.dart';
import 'package:wish_pool/widgets/app_background.dart';
import 'package:wish_pool/widgets/auth_box.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> _resetPassword() async {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _emailController.text.trim(),
        );

        Utils.showSnackBar(
            "Please check email for reseting the password. Do check inside spam as well.");
      } on FirebaseAuthException catch (e) {
        Utils.showSnackBar(e.message);
        Navigator.of(context).pop();
      }

      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    return AppBackground(
      child: Scaffold(
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
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: _resetPassword,
                      child: Text(
                        "Reset Password",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: Colors.white),
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
