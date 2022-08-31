import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_pool/themes/theme.dart';

class NoWishes extends StatelessWidget {
  const NoWishes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            Provider.of<WishPoolThemeProvider>(context).themeMode ==
                    ThemeMode.dark
                ? 'assets/empty_wishes_white.png'
                : 'assets/empty_wishes_black.png',
            width: 130,
            height: 130,
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
      ),
    );
  }
}
