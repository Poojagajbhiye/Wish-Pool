import 'package:flutter/material.dart';

class TransitionProvider with ChangeNotifier {
  bool transitionMode = false;
  bool cardHighlight = false;
  late int selectedCard;

  void cardHighligthToggle() {
    cardHighlight = !cardHighlight;
    transitionMode = !transitionMode;
    notifyListeners();
  }

  void selectCard(int i) {
    selectedCard = i;
    notifyListeners();
  }
}
