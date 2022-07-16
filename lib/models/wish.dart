class Wish {
  //TODO: Add wish ID
  String title = "";
  String description = "";
  //TODO: Add image property
  //TODO: Add wish category
  //TODO: Add shared category
  //TODO: Add fulfilled boolean property

  String get wishTitle => title;
  String get wishDescription => description;

  set wishTitle(String ttl) => title = ttl;
  set wishDescription(String desc) => description = desc;

  void updateWish(String ttl, String desc) {
    title = ttl;
    description = desc;
  }
}
