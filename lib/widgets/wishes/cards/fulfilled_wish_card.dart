import 'package:flutter/material.dart';

import '../../../models/wisher.dart';
import '../../alert_box.dart';

class FulfilledWishCard extends StatelessWidget {
  final Wisher wisher;
  final int index;
  final bool showButton;
  const FulfilledWishCard({
    required this.wisher,
    required this.index,
    required this.showButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: const Color(0xFF82776F),
      color: const Color(0xFFBBB9C0),
      // shadowColor: Color.fromARGB(255, 89, 84, 84),
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Congratulations! You've had your wish!",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontStyle: FontStyle.normal,
                        color: const Color(0xFF949292),
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
                        color: const Color(0xFF949292),
                      ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                        Color(0xFF949292), BlendMode.modulate),
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
                if (showButton)
                  TextButton(
                    onPressed: () => showDialog(
                        context: context,
                        builder: (_) => AlertBox(wishIndex: index)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'DELETE',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    // color: const Color(0xFF7548BE),
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
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
