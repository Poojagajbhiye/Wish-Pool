import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:wish_pool/screens/add_wish.dart';
import 'package:wish_pool/screens/profile.dart';
import 'package:wish_pool/widgets/wishlist_container.dart';

import '../models/wisher.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var test = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: IconButton(
            onPressed: () => Navigator.of(context).pushNamed(
              WisherProfile.routeName,
              arguments: Provider.of<Wisher>(context, listen: false).name,
            ),
            color: Colors.amber[100],
            icon: CircleAvatar(
              radius: 25,
              child: Text(
                Provider.of<Wisher>(context)
                    .name!
                    .substring(0, 1)
                    .toUpperCase(),
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        title: const Text("Wish Pool"),
        actions: [
          IconButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("Welcome ${Provider.of<Wisher>(context).name}"),
            // child: Text("Welcome ${test.email}"),
          ),
          const Expanded(
            child: WishlistContainer(),
          ),
        ],
      ),
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
