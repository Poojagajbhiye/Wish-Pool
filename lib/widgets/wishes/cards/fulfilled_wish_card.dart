import 'package:flutter/material.dart';

import '../../../models/wisher.dart';

class FulfilledWishCard extends StatelessWidget {
  final Wisher wisher;
  final int index;
  const FulfilledWishCard({
    required this.wisher,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF82776F),
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
            child: Image.asset("assets/fulfilled_wishing_star.png"),
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
                  "Congratulations! You've had your wish!",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontStyle: FontStyle.normal,
                        color: const Color(0xFFAFADAD),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  wisher.wishes.elementAt(index).title!,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFAFADAD),
                      ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                        Color(0xFFA09F9F), BlendMode.modulate),
                    child: Text(
                      wisher.wishes.elementAt(index).description!,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
