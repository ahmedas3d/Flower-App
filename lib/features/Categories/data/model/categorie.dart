class FlowerCategory {
  //  "_id": "673c46fd1159920171827c85",
  //           "name": "flowers",
  //           "slug": "flowers",
  //           "image": "https://flower.elevateegy.com/uploads/39c641a6-4ec4-421a-8f55-5d8f5eeba5c3-flowers.png",
  //           "createdAt": "2024-11-19T08:06:21.263Z",
  //           "updatedAt": "2024-11-19T08:06:21.263Z",
  //           "productsCount": 9
  final String id;
  final String name;
  final String slug;
  final String image;
  final String createdAt;
  final String updatedAt;
  final int productsCount;

  FlowerCategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.productsCount,
  });

  factory FlowerCategory.fromJson(Map<String, dynamic> json) {
    return FlowerCategory(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      productsCount: json['productsCount'],
    );
  }
}
