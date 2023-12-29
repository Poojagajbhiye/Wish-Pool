import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/wisher.dart';
import '../screens/profile.dart';

class FullViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double deviceWidth;
  const FullViewAppBar({Key? key, required this.deviceWidth}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome!',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 2.5,
              ),
              Text(
                "My Wishes",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          IconButton(
            iconSize: 50.0,
            onPressed: () => Navigator.of(context).pushNamed(
              WisherProfile.routeName,
            ),
            icon: Hero(
              tag: 'profile_pic',
              child: Provider.of<Wisher>(context).picture != null
                  ? CircleAvatar(
                      backgroundImage:
                          Provider.of<Wisher>(context).picture!.image)
                  : CircleAvatar(
                      backgroundColor: const Color(0xFFFED478),
                      radius: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(2.5),
                        child: Text(
                          Provider.of<Wisher>(context)
                              .name!
                              .substring(0, 1)
                              .toUpperCase(),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: deviceWidth * 0.07,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
