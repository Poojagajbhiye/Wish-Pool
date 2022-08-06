import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wish_pool/models/wish.dart';
import 'package:wish_pool/services/firebase_services.dart';
import 'package:wish_pool/themes/theme.dart';

class Wisher with ChangeNotifier {
  String? id;
  String? name;
  Image? picture;
  List<String> friends = [];
  List<Wish> wishes = [];
  bool changeName = false;
  bool changePicture = false;

  Future<String?> init([String? newWisherId]) async {
    var allData = await fetchAllData(newWisherId);
    print('allData: $allData');
    if (allData != null) {
      id = allData['id'];
      name = allData['name'];
      picture = allData['picture'] == null
          ? null
          : Image.network(
              allData['picture'],
              fit: BoxFit.cover,
            );
      wishes = [];
      friends = [];

      for (var wish in allData['wishes']) {
        wishes.add(Wish(
          id: wish['id'].toString(),
          title: wish['title'].toString(),
          description: wish['description'].toString(),
        ));
      }

      for (var friend in allData['friends']) {
        friends.add(friend.toString());
      }
    }
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
    );
    wishes.add(wish);
    await addWishToDb(wish: wish.toJson());
    notifyListeners();
  }

  void addWisher({
    required String wisherId,
    required String wisherName,
  }) async {
    id = wisherId;
    name = wisherName;

    await addWisherToDb(
      wisherId: id,
      wisherName: name,
      wisherPicture: picture,
      // wishes: wishes,
      // friends: friends,
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
    wishes.remove(wish);
    await removeWishFromDb(wish: wish.toJson());
    notifyListeners();
  }

  void updateWish({
    required String wishId,
    required String wishTitle,
    required String wishDescription,
  }) async {
    final wish = wishes.firstWhere((wish) => wish.id == wishId);
    await removeWishFromDb(wish: wish.toJson());
    wish.title = wishTitle;
    wish.description = wishDescription;
    await updateWishToDb(wish: wish.toJson());
    notifyListeners();
  }

  void updateWisherName(String wisherName) async {
    name = wisherName;
    await updateNameToDb(wisherName: wisherName);
    changeName = !changeName;
    notifyListeners();
  }

  Future<void> uploadWisherPic() async {
    var imageFilename = DateTime.now().millisecondsSinceEpoch.toString();
    final path = 'user_pictures/$id/dp/$imageFilename';
    String pictureUrl = await updatePictureToDb(path: path);
    picture = Image.network(
      pictureUrl,
      fit: BoxFit.cover,
    );
    notifyListeners();
  }

  // void addFriend(String newfriend) {
  //   friends.add(newfriend);
  //   notifyListeners();
  // }

  // void addFriends(List<String> newfriends) {
  //   friends.addAll(newfriends);
  //   notifyListeners();
  // }
}
