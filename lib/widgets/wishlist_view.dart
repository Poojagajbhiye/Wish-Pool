import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/wishlist.dart';
import '../screens/edit_wish.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WishList>(
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
    );
  }
}
