import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';
import 'package:wish_pool/themes/theme.dart';
import 'package:wish_pool/widgets/wishes/wish_actions.dart';

import '../../../constants/constants.dart' show cardColorsLightTheme;
import '../../../models/wisher.dart';

class WishCard extends StatelessWidget {
  final int index;
  final Function createCardHighlightOverlay;
  // final BuildContext cntxt;
  const WishCard({
    required this.index,
    required this.createCardHighlightOverlay,
    // required this.cntxt,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Wisher wisher = Provider.of<Wisher>(context);
    // Color getCardColor() {
    //   ThemeMode providerTheme =
    //       Provider.of<WishPoolThemeProvider>(context).themeMode;
    //   ThemeMode managerTheme = ThemeModeHandler.of(context)!.themeMode;
    //   if (providerTheme == ThemeMode.light && managerTheme == ThemeMode.light) {
    //     return (cardColorsLightTheme.toList()..shuffle()).first;
    //   }
    //   return const Color(0xFF8D9EC7);
    // }

    return Card(
      // color: getCardColor(),
      color: const Color(0xFFAFD0D2),
      shadowColor: Colors.black38,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(
              "assets/wishing_star.png",
              scale: 2,
            ),
          ),
          Padding(
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
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Text(
                    // max characters: 130
                    wisher.wishes.elementAt(index).description!,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                  ),
                ),
                WishActions(
                  wisher: wisher,
                  index: index,
                  createCardHighlightOverlay: createCardHighlightOverlay,
                  // cntxt: cntxt,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
