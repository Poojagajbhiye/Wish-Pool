import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';
import 'package:wish_pool/models/transition_provider.dart';
import 'package:wish_pool/themes/theme.dart';

import '../../../constants/constants.dart' show cardColorsLightTheme;
import '../../../models/wisher.dart';

class WishInTransitCard extends StatelessWidget {
  final Function flipperFunction;
  const WishInTransitCard({
    required this.flipperFunction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Wisher wisher = Provider.of<Wisher>(context);
    final TransitionProvider transitionProvider =
        Provider.of<TransitionProvider>(context);

    Color getCardColor() {
      ThemeMode providerTheme =
          Provider.of<WishPoolThemeProvider>(context).themeMode;
      ThemeMode managerTheme = ThemeModeHandler.of(context)!.themeMode;
      if (providerTheme == ThemeMode.light && managerTheme == ThemeMode.light) {
        return (cardColorsLightTheme.toList()..shuffle()).first;
      }
      return const Color(0xFF8D9EC7);
    }

    return Card(
      color: getCardColor(),
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
            child: Image.asset("assets/wishing_star.png"),
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
                  wisher.wishes
                      .elementAt(transitionProvider.selectedCard)
                      .title!,
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
                    wisher.wishes
                        .elementAt(transitionProvider.selectedCard)
                        .description!,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                  ),
                ),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        transitionProvider.cardHighligthToggle();
                      },
                      child: Text(
                        "Undo",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontSize: 15,
                                ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                        elevation: MaterialStatePropertyAll(0.0),
                      ),
                      onPressed: () async {
                        await flipperFunction();
                        await Future.delayed(
                          const Duration(milliseconds: 2500),
                        );
                        wisher.fulfillWish(
                          wishId: wisher.wishes
                              .elementAt(transitionProvider.selectedCard)
                              .id,
                        );
                        transitionProvider.cardHighligthToggle();
                      },
                      child: Text(
                        "I've had my wish",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
