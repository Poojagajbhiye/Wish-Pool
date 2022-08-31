import 'package:flutter/material.dart';

import '../../models/wish.dart';
import '../../models/wisher.dart';
import '../../screens/edit_wish.dart';

class WishActions extends StatelessWidget {
  const WishActions({
    Key? key,
    required this.wisher,
    required this.index,
  }) : super(key: key);

  final Wisher wisher;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              EditWish.routeName,
              arguments: Wish(
                id: wisher.wishes.elementAt(index).id,
                title: wisher.wishes.elementAt(index).title,
                description: wisher.wishes.elementAt(index).description,
              ),
            );
          },
          child: Text(
            'EDIT',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        TextButton(
          child: Text(
            'FULFILLED',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
          ),
          onPressed: () {},
        ),
        const SizedBox(
          width: 2,
        ),
        TextButton(
          child: Text(
            'REMOVE',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
          ),
          onPressed: () =>
              wisher.removeWish(wish: wisher.wishes.elementAt(index)),
        ),
      ],
    );
  }
}
