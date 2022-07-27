class Wish {
  final String id;
  String? title;
  String? description;
  //TODO: Add image property
  //TODO: Add wish category
  //TODO: Add shared category
  //TODO: Add fulfilled boolean property

  Wish({
    required this.id,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
      };
}
