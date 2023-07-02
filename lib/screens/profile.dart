import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';
import 'package:wish_pool/app.dart';
import 'package:wish_pool/themes/theme.dart';
import '../models/wisher.dart';

class WisherProfile extends StatelessWidget {
  static const routeName = "/profile";
  const WisherProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    final double deviceHeight = deviceSize.height;
    final double deviceWidth = deviceSize.width;
    final wisher = Provider.of<Wisher>(context);
    final TextEditingController usernameController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: deviceHeight * 0.15,
          title: Padding(
            padding: EdgeInsets.only(
              top: deviceHeight * 0.02,
            ),
            child: Column(
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
                                  controller: usernameController,
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ),
                              IconButton(
                                color: Theme.of(context).primaryIconTheme.color,
                                onPressed: () => wisher.updateWisherName(
                                  usernameController.text.trim(),
                                ),
                                icon: const Icon(
                                  Icons.edit_attributes,
                                ),
                              )
                            ]
                          : [
                              Text(
                                wisher.name!,
                                style: Theme.of(context).textTheme.labelMedium,
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
                          style: Theme.of(context).textTheme.labelMedium,
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
