import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/wisher.dart';

class WishMeter extends StatelessWidget {
  const WishMeter({super.key});

  @override
  Widget build(BuildContext context) {
    int fulfilledWishPercentage = Provider.of<Wisher>(context).wishPercentage;
    return Container(
      margin: const EdgeInsets.all(15.0),
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColor,
            const Color(0xFF9176D2),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF1B1230),
            offset: Offset(0, 5),
            blurRadius: 7.0,
            blurStyle: BlurStyle.inner,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF61A8E1),
                  Theme.of(context).primaryColor,
                ],
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: '$fulfilledWishPercentage',
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      const TextSpan(
                        text: '%',
                        style: TextStyle(
                          fontSize: 8.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Wish Meter',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Keep track of your wishes.\nGood luck for the next one!!',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.white70,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
