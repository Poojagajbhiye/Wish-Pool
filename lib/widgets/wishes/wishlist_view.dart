import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_pool/models/transition_provider.dart';
import 'package:wish_pool/widgets/wishes/cards/fulfilled_wish_card.dart';

import 'package:wish_pool/widgets/wishes/cards/wish_card.dart';
import 'package:wish_pool/widgets/wishes/no_wishes.dart';
import 'package:wish_pool/widgets/wishes/wish_in_transit.dart';

import '../../models/wisher.dart';
import '../../constants/constants.dart' show wishCardSize;
import 'cards/wish_in_transit_card.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({Key? key}) : super(key: key);

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  final ScrollController _scrollController = ScrollController();
  final _cardController = FlipCardController();
  // bool cardHighlight = false;
  // int selectedCard = 0;

  Future<void> flipWishCard() async {
    await _cardController.flipCard();
  }

  void animateToIndex(int index) {
    _scrollController.animateTo(
      index * wishCardSize,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  // void cardHighligthToggle() {
  //   setState(() {
  //     cardHighlight = !cardHighlight;
  //   });
  // }

  // void selectCard(int i) {
  //   setState(() {
  //     selectedCard = i;
  //   });
  // }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Consumer<Wisher>(
      builder: (context, wisher, _) {
        return wisher.wishes.isEmpty
            ? const Center(
                child: NoWishes(),
              )
            : AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                switchInCurve: Curves.easeInCubic,
                child: Provider.of<TransitionProvider>(context).cardHighlight
                    // : cardHighlight
                    ? Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Image.asset(
                              "assets/celebration_cone.png",
                            ),
                          ),
                          Positioned(
                            top: deviceHeight * 0.15,
                            left: deviceWidth * 0.02,
                            right: deviceWidth * 0.02,
                            child: SizedBox(
                              height: 200,
                              child: WishInTransit(
                                controller: _cardController,
                                wishInTransitCard: WishInTransitCard(
                                  // index: selectedCard,
                                  flipperFunction: flipWishCard,
                                  // sendBackCardFunction: cardHighligthToggle,
                                ),
                                fulfilledWishCard: FulfilledWishCard(
                                  wisher: wisher,
                                  index:
                                      Provider.of<TransitionProvider>(context)
                                          .selectedCard,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemExtent: wishCardSize,
                        controller: _scrollController,
                        itemCount: wisher.wishes.length,
                        itemBuilder: ((context, index) {
                          if (wisher.newWishAdded && wisher.wishes.length > 1) {
                            animateToIndex(wisher.wishes.length - 1);
                            wisher.newWishAdded = false;
                          }
                          return wisher.wishes.elementAt(index).fulfilled
                              ? FulfilledWishCard(
                                  wisher: wisher,
                                  index: index,
                                )
                              : WishCard(
                                  index: index,
                                  // cardHighlightToggle: cardHighligthToggle,
                                  // cardSelection: selectCard,
                                  // gotoCard: animateToIndex,
                                );
                        }),
                      ),
              );
      },
    );
  }
}
