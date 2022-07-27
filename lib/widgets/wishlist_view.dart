import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_pool/models/wish.dart';

import '../models/wisher.dart';
import '../screens/edit_wish.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String wisherId = FirebaseAuth.instance.currentUser!.uid;
    // CollectionReference wishers =
    //     FirebaseFirestore.instance.collection('wishers');
    return Consumer<Wisher>(builder: (context, wisher, _) {
      // return FutureBuilder<DocumentSnapshot>(
      //     future: wishers.doc(wisherId).get(),
      //     builder: (BuildContext context,
      //         AsyncSnapshot<DocumentSnapshot> snapshot) {
      //       if (snapshot.hasError) {
      //         return const Text("Something went wrong");
      //       }

      //       if (snapshot.hasData && !snapshot.data!.exists) {
      //         return const Text("Document does not exist");
      //       }

      //       if (snapshot.connectionState == ConnectionState.done) {
      //         Map<String, dynamic> wisherDetails =
      //             snapshot.data!.data() as Map<String, dynamic>;
      //         var wishes = wisherDetails['wishes'];
      return ListView.builder(
        itemCount: wisher.wishes.length,
        itemBuilder: ((context, index) {
          print(wisher.wishes);
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(wisher.wishes.elementAt(index).title!),
                      Text(wisher.wishes.elementAt(index).description!),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            EditWish.routeName,
                            arguments: Wish(
                              id: wisher.wishes.elementAt(index).id,
                              title: wisher.wishes.elementAt(index).title,
                              description:
                                  wisher.wishes.elementAt(index).description,
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                        ),
                        onPressed: () =>
                            // wishes.remove(wishes.elementAt(index))
                            wisher.removeWish(
                                wish: wisher.wishes.elementAt(index)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      );
    }
//               return const Center(child: CircularProgressIndicator());
        );
//       },
//     );
//   }
  }
}
