import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/wisher.dart';

class AlertBox extends StatelessWidget {
  const AlertBox({required this.wishIndex, super.key});
  final int wishIndex;

  @override
  Widget build(BuildContext context) {
    final Wisher wisher = Provider.of<Wisher>(context);
    return AlertDialog(
      content: const Text('Are you sure you want to delete this wish?'),
      contentTextStyle: Theme.of(context)
          .textTheme
          .labelMedium!
          .copyWith(color: Colors.black),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('No')),
        TextButton(
          onPressed: () {
            wisher.removeWish(wish: wisher.wishes.elementAt(wishIndex));
            Navigator.of(context).pop();
          },
          child: const Text('Yes'),
        ),
      ],
    );
  }
}
