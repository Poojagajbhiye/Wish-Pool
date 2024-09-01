import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_pool/models/transition_provider.dart';
import 'package:wish_pool/widgets/alert_box.dart';

import '../../models/wish.dart';
import '../../models/wisher.dart';
import '../../screens/edit_wish.dart';

class WishActions extends StatelessWidget {
  const WishActions({
    super.key,
    required this.wisher,
    required this.index,
    required this.createCardHighlightOverlay,
    // required this.cntxt,
    // required this.cardHightToggle,
    // required this.cardSelection,
    // required this.gotoCard,
  });

  final Wisher wisher;
  final int index;
  final Function createCardHighlightOverlay;
  // final BuildContext cntxt;
  // final Function cardHightToggle;
  // final Function cardSelection;
  // final Function gotoCard;

  @override
  Widget build(BuildContext context) {
    final TransitionProvider transitionProvider =
        Provider.of<TransitionProvider>(context);
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              EditWish.routeName,
              arguments: Wish(
                id: wisher.wishes.elementAt(index).id,
                title: wisher.wishes.elementAt(index).title,
                description: wisher.wishes.elementAt(index).description,
                fulfilled: wisher.wishes.elementAt(index).fulfilled,
              ),
            );
            transitionProvider.selectCard(index);
          },
          icon: Icon(
            Icons.edit_note,
            color: Theme.of(context).primaryColor,
          ),
        ),
        TextButton(
          child: Text(
            "FULFILLED",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: const Color(0xFF7548BE),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
          ),
          onPressed: () async {
            await Future.delayed(
              const Duration(
                milliseconds: 300,
              ),
            );
            transitionProvider.selectCard(index);
            createCardHighlightOverlay(
              transitionProvider.selectedCard,
              deviceWidth,
              deviceHeight,
              wisher,
            );
            // cardHightToggle();
            transitionProvider.cardHighligthToggle();
          },
        ),
        IconButton(
            icon: const Icon(
              Icons.delete_outline_rounded,
              color: Colors.red,
            ),
            onPressed: () => showDialog(
                context: context, builder: (_) => AlertBox(wishIndex: index))
            // wisher.removeWish(wish: wisher.wishes.elementAt(index)),
            ),
      ],
    );
  }
}
