import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_pool/models/wish.dart';
import 'package:wish_pool/themes/theme.dart';
import 'package:wish_pool/widgets/wishes/no_wishes.dart';
import 'package:wish_pool/widgets/wishes/wish_actions.dart';

import '../../models/wisher.dart';
import '../../screens/edit_wish.dart';
import '../../constants/constants.dart'
    show wishCardSize, cardColorsLightTheme, cardColorsDarkTheme;

class WishlistView extends StatelessWidget {
  const WishlistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getCardColor() {
      return (Provider.of<WishPoolThemeProvider>(context).themeMode ==
              ThemeMode.light)
          ? (cardColorsLightTheme.toList()..shuffle()).first
          : (cardColorsDarkTheme.toList()..shuffle()).first;
    }

    return Consumer<Wisher>(builder: (context, wisher, _) {
      return wisher.wishes.isEmpty
          ? const NoWishes()
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemExtent: wishCardSize,
              itemCount: wisher.wishes.length,
              itemBuilder: ((context, index) => Card(
                    color: getCardColor(),
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
                          Expanded(
                            child: Text(
                              // max characters: 130
                              wisher.wishes.elementAt(index).description!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15,
                                  ),
                            ),
                          ),
                          // const Spacer(),
                          WishActions(wisher: wisher, index: index),
                        ],
                      ),
                    ),
                  )),
            );
    });
  }
}
