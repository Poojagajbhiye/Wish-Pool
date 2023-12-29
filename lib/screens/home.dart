import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_pool/models/transition_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:wish_pool/models/transition_provider.dart';
import 'package:wish_pool/screens/add_wish.dart';
import 'package:wish_pool/widgets/full_view_app_bar.dart';
import 'package:wish_pool/widgets/wishes/wish_meter.dart';
import 'package:wish_pool/widgets/wishes/wishlist_container.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    final double deviceWidth = deviceSize.width;
    bool inTransit = Provider.of<TransitionProvider>(context).transitionMode;

    return Scaffold(
      appBar: FullViewAppBar(deviceWidth: deviceWidth),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!inTransit) const WishMeter(),
          const Expanded(
            child: WishlistContainer(),
          ),
        ],
      ),
      floatingActionButton: inTransit
          ? null
          : FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AddWish.routeName,
                );
              },
              child: Image.asset('assets/starButton.png'),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
