import 'package:flutter/material.dart';
import 'package:wish_pool/screens/add_wish.dart';
import 'package:wish_pool/screens/edit_wish.dart';
import 'package:wish_pool/screens/home.dart';

import 'package:provider/provider.dart';

import 'models/wishlist.dart';
import 'models/wish.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Wish()),
        ChangeNotifierProvider(create: (context) => WishList()),
      ],
      child: const MyApp(),
    ),
  );
}

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
