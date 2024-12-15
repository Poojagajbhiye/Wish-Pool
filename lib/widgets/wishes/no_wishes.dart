import 'package:flutter/material.dart';

class NoWishes extends StatelessWidget {
  const NoWishes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/empty_wishes.png',
          scale: 2,
        ),
        Text(
          'No wishes yet',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 24,
              ),
        ),
        Text(
          'Start wishing now!',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 16,
                fontStyle: FontStyle.normal,
              ),
        ),
      ],
    );
  }
}
