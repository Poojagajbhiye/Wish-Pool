import 'package:flutter/material.dart';
import 'package:wish_pool/models/wish.dart';
import 'package:wish_pool/models/wishlist.dart';
import 'package:wish_pool/screens/home.dart';

class AddWish extends StatefulWidget {
  const AddWish(this.wishes, {Key? key}) : super(key: key);
  static const routeName = '/add_wish';

  final WishList wishes;

  @override
  State<AddWish> createState() => _AddWishState();
}

class _AddWishState extends State<AddWish> {
  String title = '';
  String description = '';

  final GlobalKey<FormState> _formKey = GlobalKey();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  void submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();
    widget.wishes.addWish(Wish(title, description));
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
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
