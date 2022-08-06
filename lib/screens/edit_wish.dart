import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_pool/widgets/app_background.dart';

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
      child: AppBackground(
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
                    maxLength: 25,
                    initialValue: wish.title,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                        ),
                    onSaved: (value) {
                      title = value!;
                    },
                    decoration: InputDecoration(
                      border: Theme.of(context).inputDecorationTheme.border,
                      labelText: "Wish *",
                      labelStyle:
                          Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor,
                              ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (wishTitle) {
                      return (wishTitle == '')
                          ? 'Please enter your wish.'
                          : null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLength: 130,
                    maxLines: 3,
                    initialValue: wish.description,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                        ),
                    onSaved: (value) {
                      description = value!;
                    },
                    decoration: InputDecoration(
                      border: Theme.of(context).inputDecorationTheme.border,
                      labelText: "Describe your wish...",
                      labelStyle:
                          Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor,
                              ),
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
                        child: Text(
                          "UPDATE",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "CANCEL",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(fontSize: 15),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
