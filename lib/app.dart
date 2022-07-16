import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wish_pool/screens/auth/auth.dart';
import 'package:wish_pool/screens/profile.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Something went wrong."),
                );
              } else if (snapshot.hasData) {
                return const HomeScreen();
              } else {
                return const Auth();
              }
            }),
      ),
      routes: {
        // LogIn.routeName: (context) => LogIn(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        WisherProfile.routeName: (context) => const WisherProfile(),
        AddWish.routeName: (context) => const AddWish(),
        EditWish.routeName: (context) => EditWish(),
      },
    );
  }
}
