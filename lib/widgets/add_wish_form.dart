import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/wisher.dart';

class AddWishForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  AddWishForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String title;
    late String description;

    void submit() {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      _formKey.currentState!.save();

      Provider.of<Wisher>(context, listen: false).addWish(
        wishTitle: title,
        wishDescription: description,
      );
      Navigator.of(context).pop();
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            maxLength: 25,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                ),
            controller: _titleController,
            onSaved: (value) {
              title = value!;
            },
            decoration: InputDecoration(
              border: Theme.of(context).inputDecorationTheme.border,
              labelText: "Wish *",
              labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (wishTitle) {
              return (wishTitle == '') ? 'Please enter your wish.' : null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            maxLength: 130,
            maxLines: 3,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                ),
            controller: _descriptionController,
            onSaved: (value) {
              description = value!;
            },
            decoration: InputDecoration(
              border: Theme.of(context).inputDecorationTheme.border,
              labelText: "Describe your wish...",
              labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
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
                onPressed: submit,
                child: Text(
                  "ADD",
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
    );
  }
}
