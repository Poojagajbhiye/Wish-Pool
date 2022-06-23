import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'models/wishlist.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WishList(),
      child: const MyApp(),
    ),
  );
}
