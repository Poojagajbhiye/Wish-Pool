import 'package:flutter/material.dart';
import 'package:wish_pool/screens/add_wish.dart';
import 'package:wish_pool/widgets/custom_app_bar.dart';
import 'package:wish_pool/widgets/wishes/wishlist_container.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    final double deviceHeight = deviceSize.height;
    final double deviceWidth = deviceSize.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: deviceHeight * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(deviceWidth: deviceWidth),
            const Divider(
              color: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Wishes',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF015591),
                        ),
                  ),
                  // OutlinedButton(
                  //   style: ButtonStyle(
                  //     side: MaterialStateProperty.all(
                  //       BorderSide(
                  //         width: 1.0,
                  //         color: Color(0xFF4C2D6F),
                  //       ),
                  //     ),
                  //   ),
                  //   onPressed: () {},
                  //   child: Text(
                  //     // 'fulfilled wishes',
                  //     '..that came true',
                  //     style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  //           fontStyle: FontStyle.italic,
                  //           color: Color(0xFF4C2D6F),
                  //           fontSize: 15,
                  //         ),
                  //   ),
                  // ),
                ],
              ),
            ),
            const Expanded(
              child: WishlistContainer(),
            ),
            const SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AddWish.routeName,
          );
        },
        label: Text(
          'ADD WISH',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 15,
                color: Colors.white,
              ),
        ),
        icon: const Icon(Icons.add),
        backgroundColor: const Color(0xFF015591),
      ),
    );
  }
}
