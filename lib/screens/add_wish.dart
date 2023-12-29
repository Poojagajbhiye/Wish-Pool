import 'package:flutter/material.dart';
import 'package:wish_pool/widgets/add_wish_form.dart';

class AddWish extends StatelessWidget {
  static const routeName = '/add_wish';

  const AddWish({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Wish",
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          left: 20,
          right: 20,
        ),
        child: AddWishForm(),
      ),
    );
  }
}
