import 'package:flutter/material.dart';
import 'package:wish_pool/screens/add_wish.dart';
import 'package:wish_pool/widgets/wishlist_container.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wish Pool"),
      ),
      body: const WishlistContainer(),
      floatingActionButton: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(
            context,
            AddWish.routeName,
          );
        },
      ),
    );
  }
}
