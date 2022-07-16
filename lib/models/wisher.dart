import 'package:flutter/cupertino.dart';
import 'package:wish_pool/models/wish.dart';

// import 'wishlist.dart';
import 'wish.dart';

class Wisher with ChangeNotifier {
  String _wisherID = "";
  String _wisherName = "";
  String _wisherPic = "";
  final List<String> _friends = [];
  final List<Wish> _wishes = [];
  bool changeWisherName = false;
  bool changeWisherPic = false;

  String get userID => _wisherID;
  String get userName => _wisherName;
  String get userPic => _wisherPic;
  List<Wish> get allWishes => _wishes;
  int get totalWishes => _wishes.length;

  void createWisher(String wisherID, String wisherName) {
    _wisherID = wisherID;
    _wisherName = wisherName;
    //create default user picture
    notifyListeners();
  }

  void changeWisherNameToggle() {
    changeWisherName = !changeWisherName;
    notifyListeners();
  }

  void changeWisherPicToggle() {
    changeWisherPic = !changeWisherName;
    notifyListeners();
  }

  void updateWisherName(String newWisherName) {
    _wisherName = newWisherName;
    changeWisherName = !changeWisherName;
    notifyListeners();
  }

  void updateWisherPicture(String newWisherPicture) {
    _wisherPic = newWisherPicture;
    changeWisherPic = !changeWisherPic;
    notifyListeners();
  }

  void addWish(Wish wish) {
    // wishes.addWish(wish);
    _wishes.add(wish);
    notifyListeners();
  }

  void editWish(Wish wish) {
    wish.updateWish(wish.title, wish.description);
    notifyListeners();
  }

  void removeWish(Wish wish) {
    _wishes.remove(wish);
    notifyListeners();
  }

  void addFriend(String newfriend) {
    _friends.add(newfriend);
    notifyListeners();
  }

  void addFriends(List<String> newfriends) {
    _friends.addAll(newfriends);
    notifyListeners();
  }
}
