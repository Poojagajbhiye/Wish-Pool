import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/wisher.dart';
import '../screens/profile.dart';

class FullViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double deviceWidth;
  const FullViewAppBar({Key? key, required this.deviceWidth}) : super(key: key);

  @override
  Size get preferredSize => throw UnimplementedError();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pushNamed(
          WisherProfile.routeName,
        ),
        icon: (Provider.of<Wisher>(context).picture != null)
            ? CircleAvatar(
                backgroundImage: Provider.of<Wisher>(context).picture!.image)
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
      title: Center(
        child: Text(
          "My Wishes",
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      actions: [
        IconButton(
          iconSize: 60,
          onPressed: () => FirebaseAuth.instance.signOut(),
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.logout,
                size: 20,
              ),
              Text(
                'Log Out',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
