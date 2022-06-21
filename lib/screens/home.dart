import 'package:flutter/material.dart';
import 'package:wish_pool/models/wishlist.dart';
import 'package:wish_pool/screens/add_wish.dart';

import 'edit_wish.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(this.wishPool, {Key? key}) : super(key: key);
  static const routeName = '/home';

  final WishList wishPool;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void wishRemoved(var wish) {
    setState(() {
      widget.wishPool.removeWish(wish);
    });
  }

  @override
  Widget build(BuildContext context) {
    var wishes = widget.wishPool.wishes;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wish Pool"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          left: 20,
          right: 20,
        ),
        child: ListView.builder(
          itemCount: wishes.length,
          itemBuilder: ((context, index) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(wishes[index].title),
                          Text(wishes[index].description),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                EditWish.routeName,
                                arguments: wishes[index],
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                            ),
                            onPressed: () => wishRemoved(wishes[index]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ),
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
