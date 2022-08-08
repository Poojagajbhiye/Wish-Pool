import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_pool/screens/auth/auth.dart';
import 'package:wish_pool/screens/home.dart';
import 'package:wish_pool/widgets/app_background.dart';

import 'models/wisher.dart';

class WishPool extends StatelessWidget {
  static const routeName = '/wish_pool';
  const WishPool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBackground(
        child: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Image.asset('assets/app_icon.png'),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Something went wrong."),
                );
              } else if (snapshot.hasData) {
                return FutureBuilder(
                    future: Provider.of<Wisher>(context, listen: false)
                        .init(snapshot.data!.uid),
                    builder: (context, futureSnap) {
                      if (futureSnap.hasData) {
                        return const HomeScreen();
                      } else {
                        return Center(
                          child: Image.asset('assets/app_icon.png'),
                        );
                      }
                    });
              } else {
                return const Auth();
              }
            }),
      ),
    );
  }
}
