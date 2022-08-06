import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:wish_pool/screens/auth/auth.dart';
import 'package:wish_pool/screens/intro.dart';
import 'package:wish_pool/screens/profile.dart';
import 'package:wish_pool/widgets/app_background.dart';
import 'package:wish_pool/wish_pool.dart';

import 'models/wisher.dart';
import 'screens/add_wish.dart';
import 'screens/edit_wish.dart';
import 'screens/home.dart';
import 'utility/utils.dart';
import 'themes/theme.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  final bool _isFirstTimeUser;
  const MyApp(
    this._isFirstTimeUser, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      themeMode: Provider.of<WishPoolThemeProvider>(context).themeMode,
      theme: WishPoolTheme.appThemeLight,
      darkTheme: WishPoolTheme.appThemeDark,
      // theme: ThemeData(
      //   backgroundColor: Colors.transparent,
      //   scaffoldBackgroundColor: Colors.transparent,
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Colors.transparent,
      //   ),
      // ),
      home: SafeArea(
        child: AppBackground(
          child: _isFirstTimeUser ? const IntroScreen() : const WishPool(),
          // child: StreamBuilder<User?>(
          //     stream: FirebaseAuth.instance.authStateChanges(),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return const Center(
          //           //TODO: Have a Splash screen instead.
          //           child: CircularProgressIndicator(),
          //         );
          //       } else if (snapshot.hasError) {
          //         return const Center(
          //           child: Text("Something went wrong."),
          //         );
          //       } else if (snapshot.hasData) {
          //         return FutureBuilder(
          //             future: Provider.of<Wisher>(context, listen: false)
          //                 .init(snapshot.data!.uid),
          //             builder: (context, futureSnap) {
          //               if (futureSnap.hasData) {
          //                 return const HomeScreen();
          //               } else {
          //                 return const Center(
          //                   //TODO: Have a Splash screen instead.
          //                   child: CircularProgressIndicator(),
          //                 );
          //               }
          //             });
          //       } else {
          //         //TODO: Return IntroScreen instead
          //         if (widget.isFirstTimeUser) {
          //           return IntroScreen(changeUserStatus);
          //         }
          //         return const Auth();
          //       }
          //     }),
        ),
      ),
      routes: {
        WishPool.routeName: (context) => const WishPool(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        WisherProfile.routeName: (context) => const WisherProfile(),
        AddWish.routeName: (context) => const AddWish(),
        EditWish.routeName: (context) => EditWish(),
        Auth.routeName: (context) => const Auth(),
        IntroScreen.routeName: (context) => const IntroScreen(),
      },
    );
  }
}
