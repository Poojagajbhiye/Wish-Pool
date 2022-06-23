import 'package:flutter/material.dart';

import 'screens/add_wish.dart';
import 'screens/edit_wish.dart';
import 'screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SafeArea(
        child: HomeScreen(),
      ),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        AddWish.routeName: (context) => AddWish(),
        EditWish.routeName: (context) => EditWish(),
      },
    );
  }
}
