import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_pool/models/transition_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:wish_pool/models/transition_provider.dart';
import 'package:wish_pool/screens/add_wish.dart';
import 'package:wish_pool/widgets/full_view_app_bar.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!inTransit) FullViewAppBar(deviceWidth: deviceWidth),
          const Expanded(
            child: WishlistContainer(),
          ),
          SizedBox(
            height: 40,
            child: Container(color: Theme.of(context).primaryColor),
          ),
        ],
      ),
      floatingActionButton: inTransit
          ? null
          : FloatingActionButton.extended(
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
                    ),
              ),
              icon: const Icon(Icons.add),
              elevation: 0.0,
            ),
    );
  }
}
