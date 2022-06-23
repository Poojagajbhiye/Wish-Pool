import 'package:flutter/cupertino.dart';

import 'wish.dart';

class WishList extends ChangeNotifier {
  final List<Wish> _wishes = <Wish>[];

  List<Wish> get allWishes => _wishes;

  int get totalWishes => _wishes.length;

  void addWish(Wish wish) {
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
}
