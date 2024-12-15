import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';
import 'package:wish_pool/app.dart';
import 'package:wish_pool/themes/theme.dart';
import '../models/wisher.dart';
import '../utility/utils.dart';

class WisherProfile extends StatelessWidget {
  static const routeName = "/profile";
  const WisherProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    final double deviceHeight = deviceSize.height;
    final double deviceWidth = deviceSize.width;
    final wisher = Provider.of<Wisher>(context);

    validateUsername(value) {
      if (value != '' && value.length <= 25) {
        wisher.updateWisherName(value);
      } else {
        Utils.showSnackBar(
            "Username can't be empty or more than 25 characters.");
      }
    }

    return WillPopScope(
      onWillPop: () async {
        if (wisher.changeName) wisher.changeWisherNameToggle();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: () async {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                      await wisher.uploadWisherPic();
                      navigatorKey.currentState!.pop();
                    },
                    child: Container(
                      height: deviceHeight * 0.6,
                      width: double.infinity,
                      color: const Color(0xFFFED478),
                      child: Hero(
                        tag: 'profile_pic',
                        child: wisher.picture ??
                            Center(
                              child: Text(
                                wisher.name!.substring(0, 1).toUpperCase(),
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 100),
                              ),
                            ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: deviceWidth * 0.35,
                    bottom: 5,
                    child: ElevatedButton(
                      onPressed: () {
                        (wisher.picture != null)
                            ? wisher.removeWisherPic()
                            : null;
                      },
                      child: Text(
                        'Remove Picture',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: wisher.changeName
                          ? [
                              Flexible(
                                child: TextField(
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    labelText: 'Username',
                                    suffixIcon: Icon(
                                      Icons.person_2_rounded,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  textCapitalization: TextCapitalization.words,
                                  onSubmitted: (value) =>
                                      validateUsername(value),
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ),
                            ]
                          : [
                              Text(
                                wisher.name!,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                              IconButton(
                                color: Theme.of(context).primaryIconTheme.color,
                                onPressed: () =>
                                    wisher.changeWisherNameToggle(),
                                icon: const Icon(Icons.edit),
                              ),
                            ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Change Theme',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                        IconButton(
                          color: Theme.of(context).primaryIconTheme.color,
                          onPressed: () {
                            if (ThemeModeHandler.of(context)!.themeMode ==
                                ThemeMode.light) {
                              Provider.of<WishPoolThemeProvider>(context,
                                      listen: false)
                                  .mode = 'dark';
                              ThemeModeHandler.of(context)!
                                  .saveThemeMode(ThemeMode.dark);
                            } else {
                              Provider.of<WishPoolThemeProvider>(context,
                                      listen: false)
                                  .mode = 'light';
                              ThemeModeHandler.of(context)!
                                  .saveThemeMode(ThemeMode.light);
                            }
                          },
                          icon: Icon(ThemeModeHandler.of(context)!.themeMode ==
                                  ThemeMode.light
                              ? Icons.light_mode_rounded
                              : Icons.dark_mode_rounded),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Log Out',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                        IconButton(
                          color: Theme.of(context).primaryIconTheme.color,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => const LogOutAlertBox(),
                            );
                          },
                          icon: const Icon(Icons.logout),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LogOutAlertBox extends StatelessWidget {
  const LogOutAlertBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text('Are you sure you want to log out?'),
      contentTextStyle: Theme.of(context)
          .textTheme
          .labelMedium!
          .copyWith(color: Colors.black),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('No')),
        TextButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          child: const Text('Yes'),
        ),
      ],
    );
  }
}
