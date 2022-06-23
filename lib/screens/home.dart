import 'package:flutter/material.dart';
import 'package:wish_pool/models/wishlist.dart';
import 'package:wish_pool/screens/add_wish.dart';

import 'edit_wish.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
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
        child: Consumer<WishList>(
          builder: (context, wishes, child) => ListView.builder(
            itemCount: wishes.totalWishes,
            itemBuilder: ((context, index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(wishes.allWishes[index].title),
                            Text(wishes.allWishes[index].description),
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
                                  arguments: wishes.allWishes[index],
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
                              onPressed: () =>
                                  wishes.removeWish(wishes.allWishes[index]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          ),
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
