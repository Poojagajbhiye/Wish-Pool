class Wish {
  final String id;
  String? title;
  String? description;
  // bool fulfilled = false;

  Wish({
    required this.id,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        // 'fulfilled': fulfilled,
      };
}
