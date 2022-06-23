import 'package:flutter/cupertino.dart';

class Wish extends ChangeNotifier {
  String title = "";
  String description = "";
  //TODO: Add image property

  String get wishTitle => title;
  String get wishDescription => description;

  set wishTitle(String ttl) => title = ttl;
  set wishDescription(String desc) => description = desc;

  void updateWish(String ttl, String desc) {
    title = ttl;
    description = desc;
    notifyListeners();
  }
}
