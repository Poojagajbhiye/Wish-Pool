import 'package:flutter/material.dart';
import 'package:wish_pool/widgets/wishes/wishlist_view.dart';

class WishlistContainer extends StatelessWidget {
  const WishlistContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: const WishlistView(),
    );
  }
}
