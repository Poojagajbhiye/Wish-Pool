import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'models/wisher.dart';
import 'themes/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  var isFirstTimeUser = prefs.getBool('isFirstTimeUser');
  // isFirstTimeUser ?? await prefs.setBool('isFirstTimeUser', false);
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
      ],
      child: MyApp(
        isFirstTimeUser,
      ),
    ),
  );
}
