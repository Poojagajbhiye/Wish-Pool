import 'package:flutter/material.dart';
import 'package:wish_pool/models/wish.dart';
import 'package:wish_pool/models/wishlist.dart';
import 'package:wish_pool/screens/home.dart';

import 'package:provider/provider.dart';

class AddWish extends StatelessWidget {
  static const routeName = '/add_wish';

  final GlobalKey<FormState> _formKey = GlobalKey();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  AddWish({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = '';
    String description = '';

    void submit() {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      _formKey.currentState!.save();

      Provider.of<WishList>(context, listen: false).addWish(Wish()
        ..title = title
        ..description = description);
      Navigator.of(context).pop();
      // Navigator.of(context).pushNamed(HomeScreen.routeName);
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Wish"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 20,
            right: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  onSaved: (value) {
                    title = value!;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.star_border),
                    iconColor: Colors.amber,
                    border: InputBorder.none,
                    labelText: "Wish",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _descriptionController,
                  onSaved: (value) {
                    description = value!;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.note),
                    iconColor: Colors.amber,
                    border: InputBorder.none,
                    labelText: "Describe your wish...",
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: submit,
                      child: const Text("ADD"),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("CANCEL"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
