import 'package:flutter/material.dart';
import 'package:wish_pool/models/wish.dart';
import 'package:wish_pool/screens/home.dart';

class EditWish extends StatefulWidget {
  const EditWish({Key? key}) : super(key: key);
  static const routeName = '/edit_wish';

  @override
  State<EditWish> createState() => _EditWishState();
}

class _EditWishState extends State<EditWish> {
  String title = '';
  String description = '';

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Wish wish = ModalRoute.of(context)!.settings.arguments as Wish;

    void updateWish() {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      _formKey.currentState!.save();
      wish.updateWish(title, description);
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
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
