class Product {
  final int id;
  final String name;
  final String tagline;
  final String description;
  final String price;
  final String currency;
  final String image;
  final Map<String, String> specs;

  Product({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.price,
    required this.currency,
    required this.image,
    required this.specs,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final specsMap = <String, String>{};
    if (json['specs'] is Map) {
      (json['specs'] as Map).forEach((key, value) {
        specsMap[key.toString()] = value.toString();
      });
    }

    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      tagline: json['tagline'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: json['price'] as String? ?? '0',
      currency: json['currency'] as String? ?? 'USD',
      image: json['image'] as String? ?? '',
      specs: specsMap,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'tagline': tagline,
      'description': description,
      'price': price,
      'currency': currency,
      'image': image,
      'specs': specs,
    };
  }
}
