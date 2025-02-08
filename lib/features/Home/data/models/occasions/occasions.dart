class OccasionsModel {
  final String id;
  final String name;
  final String slug;
  final String image;
  final int productsCount;
  final String createdAt;
  OccasionsModel({
    required this.createdAt,
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.productsCount,
  });

  factory OccasionsModel.fromJson(Map<String, dynamic> json) {
    return OccasionsModel(
      createdAt: json['createdAt'],
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
      productsCount: json['productsCount'],
    );
  }
}
