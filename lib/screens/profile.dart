import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/wisher.dart';

class WisherProfile extends StatelessWidget {
  static const routeName = "/profile";
  const WisherProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String userName = Provider.of<Wisher>(context).userName;
    final TextEditingController usernameController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(children: [
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.blueGrey,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        userName.substring(0, 1).toUpperCase(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 100),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Upload"),
                      ),
                    ],
                  ),
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
            Consumer<Wisher>(
              builder: ((context, wisher, _) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: wisher.changeWisherName
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
                            Text(userName,
                                style: const TextStyle(color: Colors.black)),
                            IconButton(
                              onPressed: () => wisher.changeWisherNameToggle(),
                              icon: const Icon(Icons.edit),
                            ),
                          ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
