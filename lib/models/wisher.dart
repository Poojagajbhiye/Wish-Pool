import 'package:flutter/material.dart' hide Key;
import 'package:encrypt/encrypt.dart';
import 'package:wish_pool/models/wish.dart';
import 'package:wish_pool/services/firebase_services.dart';

class Wisher with ChangeNotifier {
  String? id;
  String? name;
  Image? picture;
  String? picturePath;
  List<String> friends = [];
  List<Wish> wishes = [];
  bool changeName = false;
  bool changePicture = false;
  bool newWishAdded = false;
  int wishPercentage = 0;

  final key = Key.fromUtf8('FLnXlzYTJ9O+EdlqBYHHJVf1js8+1M/B');
  final iv = IV.fromUtf8('zvSJfRoGB0Jtx4m/');

  int get wishesLength => wishes.length;

  int get wishesFulfilled {
    int fulfilledWishesCount = 0;
    for (Wish wish in wishes) {
      if (wish.fulfilled) {
        fulfilledWishesCount++;
      }
    }
    return fulfilledWishesCount;
  }

  calculateWishPercentage() {
    if (wishesLength > 0) {
      wishPercentage = ((wishesFulfilled / wishesLength) * 100).floor();
    }
  }

  Wish encryptWish(Wish wish) {
    final wishEncrypter = Encrypter(AES(key, mode: AESMode.cbc));
    wish.title = wishEncrypter.encrypt(wish.title!, iv: iv).base64;
    if (wish.description != "") {
      wish.description =
          wishEncrypter.encrypt(wish.description!, iv: iv).base64;
    }
    return wish;
  }

  Wish decryptWish(Wish wish) {
    final wishDecrypter = Encrypter(AES(key, mode: AESMode.cbc));
    wish.title =
        wishDecrypter.decrypt(Encrypted.fromBase64(wish.title!), iv: iv);
    if (wish.description != "") {
      wish.description = wishDecrypter
          .decrypt(Encrypted.fromBase64(wish.description!), iv: iv);
    }
    return wish;
  }

  String getValidatedWishername(String wisherName) {
    var validatedWisherName = wisherName;
    if (wisherName.length >= 25) {
      validatedWisherName = wisherName.split('@')[0];
    }
    return validatedWisherName;
  }

  Future<String?> init([String? newWisherId]) async {
    var allData = await fetchAllData(newWisherId);
    if (allData != null) {
      id = allData['id'];
      name = getValidatedWishername(allData['name']);
      // name = allData['name'];
      picture = allData['picture'] == null
          ? null
          : Image.network(
              allData['picture'],
              fit: BoxFit.cover,
            );
      picturePath = allData['picturePath'];
      wishes = [];
      friends = [];

      for (var wish in allData['wishes']) {
        Wish wishObj = Wish(
          id: wish['id'].toString(),
          title: wish['title'],
          description: wish['description'].toString(),
          fulfilled: wish['fulfilled'],
        );
        Wish decryptedWish = decryptWish(wishObj);
        wishes.add(decryptedWish);
      }

      for (var friend in allData['friends']) {
        friends.add(friend.toString());
      }
    }
    newWishAdded = false;
    calculateWishPercentage();
    return id;
  }

  void addWish({
    required String wishTitle,
    required String wishDescription,
  }) async {
    final wish = Wish(
      id: DateTime.now().toString(),
      title: wishTitle,
      description: wishDescription,
      fulfilled: false,
    );
    wishes.add(wish);
    Wish wishCopy = Wish(
      id: wish.id,
      title: wish.title,
      description: wish.description,
      fulfilled: false,
    );
    final encryptedWish = encryptWish(wishCopy);
    await addWishToDb(wish: encryptedWish.toJson());
    newWishAdded = true;
    calculateWishPercentage();
    notifyListeners();
  }

  void addWisher({
    required String wisherId,
    required String wisherName,
  }) async {
    id = wisherId;
    name = getValidatedWishername(wisherName);
    await addWisherToDb(
      wisherId: id,
      wisherName: name,
    );
    notifyListeners();
  }

  void changeWisherNameToggle() {
    changeName = !changeName;
    notifyListeners();
  }

  void changeWisherPicToggle() {
    changePicture = !changePicture;
    notifyListeners();
  }

  void removeWish({required Wish wish}) async {
    wishes.remove(encryptWish(wish));
    await removeWishFromDb(wish: wish.toJson());
    calculateWishPercentage();
    notifyListeners();
  }

  Future<void> removeWisher({required String wisherId}) async {
    await removeWishserFromDb(wisherId: wisherId);
  }

  void updateWish({
    required String wishId,
    required String wishTitle,
    required String wishDescription,
  }) async {
    final wish = wishes.firstWhere((wish) => wish.id == wishId);
    await removeWishFromDb(wish: encryptWish(wish).toJson());
    wish.title = wishTitle;
    wish.description = wishDescription;
    Wish wishCopy = Wish(
      id: wish.id,
      title: wish.title,
      description: wish.description,
      fulfilled: false,
    );
    final encryptedWish = encryptWish(wishCopy);
    await updateWishToDb(wish: encryptedWish.toJson());
    notifyListeners();
  }

  void fulfillWish({required String wishId}) async {
    final wish = wishes.firstWhere((wish) => wish.id == wishId);
    Wish wishCopy = Wish(
      id: wish.id,
      title: wish.title,
      description: wish.description,
      fulfilled: false,
    );
    final encryptedWish = encryptWish(wishCopy);
    await removeWishFromDb(wish: encryptedWish.toJson());
    wish.fulfilled = true;
    wishCopy.fulfilled = true;
    await updateWishToDb(wish: encryptedWish.toJson());
    calculateWishPercentage();
    notifyListeners();
  }

  void updateWisherName(String wisherName) async {
    name = getValidatedWishername(wisherName);
    await updateNameToDb(wisherName: name);
    changeName = !changeName;
    notifyListeners();
  }

  Future<void> uploadWisherPic() async {
    var imageFilename = DateTime.now().millisecondsSinceEpoch.toString();
    var prevPicPath = picturePath;
    picturePath = 'user_pictures/$id/dp/$imageFilename';
    final path = await updatePictureToDb(
        path: picturePath, existingPicPath: prevPicPath);
    picture = Image.network(
      path,
      fit: BoxFit.cover,
    );
    notifyListeners();
  }

  Future<void> removeWisherPic() async {
    removePictureFromDb(path: picturePath);
    picturePath = null;
    picture = null;
    notifyListeners();
  }
}
