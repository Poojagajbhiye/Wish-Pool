import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:wish_pool/screens/auth/auth.dart';
import 'package:wish_pool/screens/profile.dart';

import 'models/wisher.dart';
import 'screens/add_wish.dart';
import 'screens/edit_wish.dart';
import 'screens/home.dart';
import 'utility/utils.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  //TODO: Have a Splash screen instead.
                  child: CircularProgressIndicator(),
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
                        return const Center(
                          //TODO: Have a Splash screen instead.
                          child: CircularProgressIndicator(),
                        );
                      }
                    });
              } else {
                //TODO: Return IntroScreen instead
                return const Auth();
              }
            }),
      ),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        WisherProfile.routeName: (context) => const WisherProfile(),
        AddWish.routeName: (context) => const AddWish(),
        EditWish.routeName: (context) => EditWish(),
      },
    );
  }
}
