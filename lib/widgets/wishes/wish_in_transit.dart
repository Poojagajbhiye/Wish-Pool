import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wish_pool/widgets/wishes/cards/fulfilled_wish_card.dart';
import 'package:wish_pool/widgets/wishes/cards/wish_in_transit_card.dart';

class FlipCardController {
  _WishInTransitState? _state;
  Future flipCard() async => _state?.flipCard();
}

class WishInTransit extends StatefulWidget {
  final FlipCardController controller;
  final WishInTransitCard wishInTransitCard;
  final FulfilledWishCard fulfilledWishCard;
  const WishInTransit({
    required this.wishInTransitCard,
    required this.fulfilledWishCard,
    required this.controller,
    super.key,
  });

  @override
  State<WishInTransit> createState() => _WishInTransitState();
}

class _WishInTransitState extends State<WishInTransit>
    with TickerProviderStateMixin {
  bool isFront = true;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );

    widget.controller._state = this;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future flipCard() async {
    isFront = !isFront;

    await controller.forward();
  }

  bool isFrontCard(double angle) {
    const degrees90 = pi / 2;
    const degrees270 = 3 * pi / 2;

    return angle <= degrees90 || angle >= degrees270;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: ((context, child) {
        final angle = controller.value * -pi;
        final transform = Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(angle);
        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: isFrontCard(angle.abs())
              ? widget.wishInTransitCard
              : Transform(
                  transform: Matrix4.identity()..rotateX(pi),
                  alignment: Alignment.center,
                  child: widget.fulfilledWishCard,
                ),
        );
      }),
    );
  }
}
