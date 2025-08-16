import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

String wisherId = FirebaseAuth.instance.currentUser!.uid;

var wishersCollection = FirebaseFirestore.instance.collection("wishers");

Future<void> addWisherToDb({required wisherId, required wisherName}) async {
  final dbWisher = wishersCollection.doc(wisherId);
  final Map<String, dynamic> json = {
    'id': wisherId,
    'name': wisherName,
    'picture': null,
    'picturePath': null,
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

Future<void> removeWishserFromDb({required String wisherId}) async {
  final dbWisher = wishersCollection.doc(wisherId);
  await dbWisher.delete();
}

Future<void> updateNameToDb({required wisherName}) async {
  final dbWisher = wishersCollection.doc(wisherId);
  await dbWisher.update({
    'name': wisherName,
  });
}

Future<String> updatePictureToDb({
  required path,
  required existingPicPath,
}) async {
  if (existingPicPath != null) {
    final Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(existingPicPath);
    await firebaseStorageRef.delete();
  }

  final Reference firebaseStorageRef =
      FirebaseStorage.instance.ref().child(path);
  final ImagePicker picker = ImagePicker();
  XFile? imageFile = await picker.pickImage(source: ImageSource.gallery);

  final croppedFile = await ImageCropper.platform.cropImage(
    sourcePath: imageFile!.path,
    aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
  );

  final file = File(croppedFile!.path);
  UploadTask uploadTask = firebaseStorageRef.putFile(file);
  var storageTaskSnapshot = await uploadTask.whenComplete((() => null));
  var downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
  String picture = downloadUrl.toString();
  final dbWisher = wishersCollection.doc(wisherId);
  await dbWisher.update({
    'picture': picture,
    'picturePath': path,
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

Future<void> removePictureFromDb({required path}) async {
  final dbWisher = wishersCollection.doc(wisherId);
  await dbWisher.update({
    'picture': null,
    'picturePath': null,
  });

  final Reference firebaseStorageRef =
      FirebaseStorage.instance.ref().child(path);
  firebaseStorageRef.delete();
}
