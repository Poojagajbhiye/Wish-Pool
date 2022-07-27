import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/wisher.dart';

class WisherProfile extends StatelessWidget {
  static const routeName = "/profile";
  const WisherProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wisher = Provider.of<Wisher>(context);
    final TextEditingController usernameController = TextEditingController();

    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            GestureDetector(
              onTap: () => wisher.uploadWisherPic(),
              child: Container(
                height: 300,
                width: double.infinity,
                color: Colors.blueGrey,
                child: wisher.picture != null
                    ? Image.network(
                        wisher.picture as String,
                        fit: BoxFit.contain,
                      )
                    : Center(
                        child: Text(
                        wisher.name!.substring(0, 1).toUpperCase(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 100),
                      )),
              ),
            ),
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back),
            ),
          ]),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: wisher.changeName
                ? [
                    Flexible(
                      child: TextField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => wisher.updateWisherName(
                        usernameController.text.trim(),
                      ),
                      icon: const Icon(Icons.edit_attributes),
                    )
                  ]
                : [
                    Text(wisher.name!,
                        style: const TextStyle(color: Colors.black)),
                    IconButton(
                      onPressed: () => wisher.changeWisherNameToggle(),
                      icon: const Icon(Icons.edit),
                    ),
                  ],
          )
        ],
      ),
    ));
  }
}
