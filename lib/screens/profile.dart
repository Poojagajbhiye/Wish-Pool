import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_pool/app.dart';
import 'package:wish_pool/themes/theme.dart';
import 'package:wish_pool/widgets/app_background.dart';

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
    final theme = Provider.of<WishPoolThemeProvider>(context);
    final TextEditingController usernameController = TextEditingController();

    return SafeArea(
      child: AppBackground(
        child: Scaffold(
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
                        height: deviceHeight * 0.65,
                        width: double.infinity,
                        color: Colors.blueGrey,
                        child: wisher.picture ??
                            Center(
                              child: Text(
                                wisher.name!.substring(0, 1).toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 100),
                              ),
                            ),
                      ),
                    ),
                    IconButton(
                      color: Theme.of(context).primaryIconTheme.color,
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back),
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
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
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
                    mainAxisAlignment: MainAxisAlignment.start,
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
                                  color:
                                      Theme.of(context).primaryIconTheme.color,
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
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                IconButton(
                                  color:
                                      Theme.of(context).primaryIconTheme.color,
                                  onPressed: () =>
                                      wisher.changeWisherNameToggle(),
                                  icon: const Icon(Icons.edit),
                                ),
                              ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Change Theme',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          IconButton(
                            color: Theme.of(context).primaryIconTheme.color,
                            onPressed: () => theme.isLightMode
                                ? theme.mode = 'dark'
                                : theme.mode = 'light',
                            icon: Icon(
                              theme.isLightMode
                                  ? Icons.light_mode_rounded
                                  : Icons.dark_mode_rounded,
                            ),
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
      ),
    );
  }
}
