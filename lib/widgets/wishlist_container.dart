import 'package:flutter/material.dart';
import 'package:wish_pool/widgets/wishlist_view.dart';

class WishlistContainer extends StatelessWidget {
  const WishlistContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        // top: 10,
        left: 20,
        right: 20,
      ),
      child: WishlistView(),
    );
  }
}
