import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/wisher.dart';
import '../screens/profile.dart';

class CustomAppBar extends StatelessWidget {
  final double deviceWidth;
  final double deviceHeight;
  const CustomAppBar({
    super.key,
    required this.deviceWidth,
    required this.deviceHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: deviceHeight * 0.02,
      ),
      child: Row(
        children: [
          IconButton(
            iconSize: deviceWidth * 0.20,
            onPressed: () => Navigator.of(context).pushNamed(
              WisherProfile.routeName,
            ),
            icon: (Provider.of<Wisher>(context).picture != null)
                ? CircleAvatar(
                    radius: deviceWidth * 0.09,
                    backgroundImage:
                        Provider.of<Wisher>(context).picture!.image)
                : CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: double.infinity,
                    child: Text(
                      Provider.of<Wisher>(context)
                          .name!
                          .substring(0, 1)
                          .toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: deviceWidth * 0.10,
                      ),
                    ),
                  ),
          ),
          const SizedBox(
            width: 40,
          ),
          Flexible(
            child: SizedBox(
              width: deviceWidth * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome!",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: deviceWidth * 0.04,
                        ),
                  ),
                  Text(
                    Provider.of<Wisher>(context).name!,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: deviceWidth * 0.08,
                        ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          IconButton(
            iconSize: 60,
            color: Theme.of(context).primaryIconTheme.color,
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
      ),
    );
  }
}
