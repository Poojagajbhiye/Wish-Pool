import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/wisher.dart';
import '../screens/edit_wish.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Wisher>(
      builder: (context, wisher, _) => ListView.builder(
        itemCount: wisher.totalWishes,
        itemBuilder: ((context, index) => Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(wisher.allWishes[index].title),
                        Text(wisher.allWishes[index].description),
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
                              arguments: wisher.allWishes[index],
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
                              wisher.removeWish(wisher.allWishes[index]),
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
