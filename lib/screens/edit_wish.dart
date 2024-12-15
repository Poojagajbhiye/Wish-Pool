import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';

import '../models/wish.dart';
import '../models/wisher.dart';

class EditWish extends StatelessWidget {
  static const routeName = '/edit_wish';
  final GlobalKey<FormState> _formKey = GlobalKey();

  EditWish({super.key});

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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Wish",
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 20,
                initialValue: wish.title,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      color: ThemeModeHandler.of(context)!.themeMode ==
                              ThemeMode.light
                          ? const Color(0xFF290139)
                          : Colors.grey,
                    ),
                textCapitalization: TextCapitalization.sentences,
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
                initialValue: wish.description,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      color: ThemeModeHandler.of(context)!.themeMode ==
                              ThemeMode.light
                          ? const Color(0xFF290139)
                          : Colors.grey,
                    ),
                textCapitalization: TextCapitalization.sentences,
                onSaved: (value) {
                  description = value!;
                },
                decoration: InputDecoration(
                  border: Theme.of(context).inputDecorationTheme.border,
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
                    onPressed: updateWish,
                    child: Text(
                      "UPDATE",
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
        ),
      ),
    );
  }
}
