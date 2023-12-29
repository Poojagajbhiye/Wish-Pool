import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wish_pool/firebase_options.dart';
import 'package:wish_pool/models/transition_provider.dart';
import 'package:wish_pool/services/app_updates.dart';

import 'app.dart';
import 'models/wisher.dart';
import 'themes/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  checkForAppUpdate();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  final prefs = await SharedPreferences.getInstance();
  var isFirstTimeUser = prefs.getBool('isFirstTimeUser');
  if (isFirstTimeUser == null) {
    isFirstTimeUser = true;
    await prefs.setBool('isFirstTimeUser', false);
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Wisher(),
        ),
        ChangeNotifierProvider(
          create: (_) => WishPoolThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TransitionProvider(),
        ),
      ],
      child: MyApp(
        isFirstTimeUser,
      ),
    ),
  );
}
