class occasions {
  final String id;
  final String name;
  final String slug;
  final String image;
  final int productsCount;
  final String createdAt;
  occasions({
    required this.createdAt,
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.productsCount,
  });

  factory occasions.fromJson(Map<String, dynamic> json) {
    return occasions(
      createdAt: json['createdAt'],
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
      productsCount: json['productsCount'],
    );
  }
}
