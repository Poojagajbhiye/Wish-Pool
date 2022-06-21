import 'package:flutter/material.dart';
import 'package:wish_pool/screens/add_wish.dart';
import 'package:wish_pool/screens/edit_wish.dart';
import 'package:wish_pool/screens/home.dart';

import 'models/wishlist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final WishList wishPool = WishList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: HomeScreen(wishPool),
      ),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(wishPool),
        AddWish.routeName: (context) => AddWish(wishPool),
        EditWish.routeName: (context) => const EditWish(),
      },
    );
  }
}
