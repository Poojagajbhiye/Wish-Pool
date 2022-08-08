import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/wisher.dart';
import '../screens/profile.dart';

class CustomAppBar extends StatelessWidget {
  final double deviceWidth;
  const CustomAppBar({Key? key, required this.deviceWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          iconSize: deviceWidth * 0.20,
          onPressed: () => Navigator.of(context).pushNamed(
            WisherProfile.routeName,
            // arguments: Provider.of<Wisher>(context, listen: false).name,
          ),
          icon: (Provider.of<Wisher>(context).picture != null)
              ? CircleAvatar(
                  radius: deviceWidth * 0.09,
                  backgroundImage: Provider.of<Wisher>(context).picture!.image)
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
          color: Theme.of(context).primaryIconTheme.color,
          onPressed: () => FirebaseAuth.instance.signOut(),
          icon: const Icon(
            Icons.logout,
          ),
        ),
      ],
    );
  }
}
