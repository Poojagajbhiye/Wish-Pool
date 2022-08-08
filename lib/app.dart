import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wish_pool/screens/auth/auth.dart';
import 'package:wish_pool/screens/intro.dart';
import 'package:wish_pool/screens/profile.dart';
import 'package:wish_pool/widgets/app_background.dart';
import 'package:wish_pool/wish_pool.dart';

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
      builder: (context, widget) {
        Widget error = const Text('...rendering error...');
        if (widget is Scaffold || widget is Navigator) {
          error = Scaffold(
            body: Center(
              child: error,
            ),
          );
        }
        ErrorWidget.builder = (errorDetails) => error;
        if (widget != null) return widget;
        throw ('widget is null');
      },
      scaffoldMessengerKey: Utils.messengerKey,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      themeMode: Provider.of<WishPoolThemeProvider>(context).themeMode,
      theme: WishPoolTheme.appThemeLight,
      darkTheme: WishPoolTheme.appThemeDark,
      home: SafeArea(
        child: AppBackground(
          child: _isFirstTimeUser ? const IntroScreen() : const WishPool(),
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
