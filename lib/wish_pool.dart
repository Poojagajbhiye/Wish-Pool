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
                print('waiting');
                return Center(
                  //TODO: Have a Splash screen instead.
                  child: Image.asset('assets/wish_pool_cloud_new.png'),
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
                      print('is the problem here?');
                      print(futureSnap.data);
                      if (futureSnap.hasData) {
                        return const HomeScreen();
                      } else {
                        return Center(
                          //TODO: Have a Splash screen instead.
                          // child: CircularProgressIndicator(),
                          child: Image.asset('assets/wish_pool_cloud_new.png'),
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
