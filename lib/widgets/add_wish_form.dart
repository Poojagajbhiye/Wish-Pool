import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';

import '../models/wisher.dart';

class AddWishForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  AddWishForm({super.key});

  @override
  Widget build(BuildContext context) {
    late String title;
    late String description;

    Future<void> submit() async {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      _formKey.currentState!.save();

      Provider.of<Wisher>(context, listen: false).addWish(
        wishTitle: title,
        wishDescription: description,
      );
      FocusScope.of(context).unfocus();
      await Future.delayed(
        const Duration(
          milliseconds: 100,
        ),
      );
      Navigator.of(context).pop();
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            maxLength: 20,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  color:
                      ThemeModeHandler.of(context)!.themeMode == ThemeMode.light
                          ? const Color(0xFF290139)
                          : Colors.grey,
                ),
            textCapitalization: TextCapitalization.sentences,
            controller: _titleController,
            onSaved: (value) {
              title = value!;
            },
            decoration: InputDecoration(
              border: Theme.of(context).inputDecorationTheme.border,
              labelText: "Wish *",
              labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 18,
                    color: ThemeModeHandler.of(context)!.themeMode ==
                            ThemeMode.light
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
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
            maxLength: 100,
            maxLines: 3,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  color:
                      ThemeModeHandler.of(context)!.themeMode == ThemeMode.light
                          ? const Color(0xFF290139)
                          : Colors.grey,
                ),
            textCapitalization: TextCapitalization.sentences,
            controller: _descriptionController,
            onSaved: (value) {
              description = value!;
            },
            decoration: InputDecoration(
              labelText: "I wish...",
              labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 18,
                    color: ThemeModeHandler.of(context)!.themeMode ==
                            ThemeMode.light
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
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
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all(0.0),
                ),
                onPressed: submit,
                child: Text(
                  "ADD",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontSize: 15),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "CANCEL",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 15,
                        color: ThemeModeHandler.of(context)!.themeMode ==
                                ThemeMode.light
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
