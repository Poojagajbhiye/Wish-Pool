import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/wish.dart';
import '../models/wisher.dart';

class EditWish extends StatelessWidget {
  static const routeName = '/edit_wish';
  final GlobalKey<FormState> _formKey = GlobalKey();

  EditWish({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wish = ModalRoute.of(context)!.settings.arguments as Wish;
    late String title;
    late String description;
    void updateWish() {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      _formKey.currentState!.save();
      Provider.of<Wisher>(context, listen: false).updateWish(
        wishId: wish.id,
        wishTitle: title,
        wishDescription: description,
      );
      Navigator.of(context).pop();
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit Wish"),
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
                  initialValue: wish.title,
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
                  initialValue: wish.description,
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
                      onPressed: updateWish,
                      child: const Text("UPDATE"),
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
