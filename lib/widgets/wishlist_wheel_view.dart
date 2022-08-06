import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_pool/models/wish.dart';
import 'package:wish_pool/themes/theme.dart';

import '../models/wisher.dart';
import '../screens/edit_wish.dart';
import '../constants/constants.dart'
    show wishCardSize, cardColorsLightTheme, cardColorsDarkTheme;

class WishlistView1 extends StatelessWidget {
  const WishlistView1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Wisher>(builder: (context, wisher, _) {
      return wisher.wishes.isEmpty
          ? Center(
              child: Column(
                children: [
                  Image.asset(
                    Provider.of<WishPoolThemeProvider>(context).themeMode ==
                            ThemeMode.dark
                        ? 'assets/empty_wishes_white.png'
                        : 'assets/empty_wishes_black.png',
                    width: 130,
                    height: 130,
                  ),
                  Text(
                    'No wishes yet',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 24,
                        ),
                  ),
                  Text(
                    'Start wishing now!',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                        ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemExtent: wishCardSize,
              itemCount: wisher.wishes.length,
              itemBuilder: ((context, index) => Card(
                    color: (Provider.of<WishPoolThemeProvider>(context)
                                .themeMode ==
                            ThemeMode.light)
                        ? (cardColorsLightTheme.toList()..shuffle()).first
                        : (cardColorsDarkTheme.toList()..shuffle()).first,
                    shadowColor: Colors.black38,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 20,
                        right: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            wisher.wishes.elementAt(index).title!,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF00355A),
                                ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            // max characters: 130
                            wisher.wishes.elementAt(index).description!,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                    ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    EditWish.routeName,
                                    arguments: Wish(
                                      id: wisher.wishes.elementAt(index).id,
                                      title:
                                          wisher.wishes.elementAt(index).title,
                                      description: wisher.wishes
                                          .elementAt(index)
                                          .description,
                                    ),
                                  );
                                },
                                child: Text(
                                  'EDIT',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                        color: Colors.blue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              TextButton(
                                child: Text(
                                  'REMOVE',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                        color: Colors.blue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                onPressed: () => wisher.removeWish(
                                    wish: wisher.wishes.elementAt(index)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            );
    });
  }
}
