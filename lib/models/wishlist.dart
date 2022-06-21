import 'wish.dart';

class WishList {
  List<Wish> wishes = <Wish>[
    Wish("Sunglasses", "sample description of sunglasses."),
    Wish("Shoes", "sample description of shoes."),
    Wish("Maldives", "sample description of maldives."),
    Wish("Maldives", "sample description of maldives."),
    Wish("Maldives", "sample description of maldives."),
    Wish("Maldives", "sample description of maldives."),
  ];

  void addWish(Wish wish) {
    wishes.add(wish);
  }

  void removeWish(Wish wish) {
    wishes.remove(wish);
  }
}
