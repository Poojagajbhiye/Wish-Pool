class Wish {
  String title;
  String description;
  //TODO: Add image property

  Wish(this.title, this.description);

  void updateWish(String title, String description) {
    this.title = title;
    this.description = description;
  }
}
