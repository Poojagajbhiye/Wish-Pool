import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_pool/models/wish.dart';

import '../models/wisher.dart';
import '../screens/edit_wish.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Wisher>(builder: (context, wisher, _) {
      return ListView.builder(
        itemCount: wisher.wishes.length,
        itemBuilder: ((context, index) {
          return Card(
            color: Colors.purple[100],
            shadowColor: Colors.black38,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 5,
            clipBehavior: Clip.none,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(wisher.wishes.elementAt(index).title!),
                      Text(wisher.wishes.elementAt(index).description!),
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
                            arguments: Wish(
                              id: wisher.wishes.elementAt(index).id,
                              title: wisher.wishes.elementAt(index).title,
                              description:
                                  wisher.wishes.elementAt(index).description,
                            ),
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
                        onPressed: () => wisher.removeWish(
                            wish: wisher.wishes.elementAt(index)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      );
    });
  }
}
