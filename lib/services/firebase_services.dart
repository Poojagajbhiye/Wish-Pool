import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

String wisherId = FirebaseAuth.instance.currentUser!.uid;

var wishersCollection = FirebaseFirestore.instance.collection("wishers");

Future<void> addWisherToDb({
  required wisherId,
  required wisherName,
  required wisherPicture,
}) async {
  final dbWisher = wishersCollection.doc(wisherId);
  final Map<String, dynamic> json = {
    'id': wisherId,
    'name': wisherName,
    'picture': wisherPicture,
    'friends': [],
    'wishes': [],
  };
  await dbWisher.set(json);
}

Future<void> addWishToDb({
  required wish,
}) async {
  final dbWisher = wishersCollection.doc(wisherId);
  await dbWisher.update({
    'wishes': FieldValue.arrayUnion([wish]),
  });
}

Future<Map<String, dynamic>?> fetchAllData([String? newWisherId]) async {
  if (newWisherId == null) {
    return null;
  } else {
    wisherId = newWisherId;
  }
  final DocumentSnapshot<Map<String, dynamic>> data =
      await wishersCollection.doc(wisherId).get();
  return data.data();
}

Future<void> removeWishFromDb({
  required wish,
}) async {
  final dbWisher = wishersCollection.doc(wisherId);
  await dbWisher.update({
    'wishes': FieldValue.arrayRemove([wish]),
  });
}

Future<void> updateNameToDb({required wisherName}) async {
  final dbWisher = wishersCollection.doc(wisherId);
  await dbWisher.update({
    'name': wisherName,
  });
}

Future<String> updatePictureToDb({required path}) async {
  final Reference firebaseStorageRef =
      FirebaseStorage.instance.ref().child(path);
  PickedFile? imageFile =
      // ignore: invalid_use_of_visible_for_testing_member
      await ImagePicker.platform.pickImage(source: ImageSource.gallery);
  final file = File(imageFile!.path);
  UploadTask uploadTask = firebaseStorageRef.putFile(file);
  var storageTaskSnapshot = await uploadTask.whenComplete((() => null));
  var downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
  String picture = downloadUrl.toString();
  final dbWisher = wishersCollection.doc(wisherId);
  await dbWisher.update({
    'picture': picture,
  });
  return picture;
}

Future<void> updateWishToDb({
  required wish,
}) async {
  final dbWisher = wishersCollection.doc(wisherId);
  await dbWisher.update({
    'wishes': FieldValue.arrayUnion([wish]),
  });
}
