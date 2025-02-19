class ProductModel {
  final String privetId;
  final String title;
  final String slug;
  final String description;
  final String imageCover;
  final List<String> images;
  final int price;
  final int priceAfterDiscount;
  final int discount;
  int quantity;
  final String category;
  final String occasion;
  final String createAt;
  final String updateAt;
  final int v;
  final String id;

  ProductModel({
    required this.privetId,
    required this.title,
    required this.slug,
    required this.description,
    required this.imageCover,
    required this.images,
    required this.price,
    required this.priceAfterDiscount,
    required this.discount,
    required this.quantity,
    required this.category,
    required this.occasion,
    required this.createAt,
    required this.updateAt,
    required this.v,
    required this.id,
  });
  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      privetId: jsonData["_id"],
      title: jsonData["title"],
      slug: jsonData["slug"],
      description: jsonData["description"],
      imageCover: jsonData["imgCover"],
      images: List<String>.from(jsonData["images"]),
      price: jsonData["price"],
      priceAfterDiscount: jsonData["priceAfterDiscount"],
      discount: jsonData["discount"],
      quantity: jsonData["quantity"],
      category: jsonData["category"],
      occasion: jsonData["occasion"],
      createAt: jsonData["createdAt"],
      updateAt: jsonData["updatedAt"],
      v: jsonData["__v"],
      id: jsonData["id"],
    );
  }
}
