class Product {
  final String uniqId;
  final String title;
  final double? price;
  final bool available;
  final String? color;
  final String? material;
  final String? manufacturer;
  final String? countryOfOrigin;
  final String? description;
  final List<String> images;

  Product({
    required this.uniqId,
    required this.title,
    this.price,
    required this.available,
    this.color,
    this.material,
    this.manufacturer,
    this.countryOfOrigin,
    this.description,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    List<String> parseImages(dynamic imagesData) {
      if (imagesData == null) return [];

      if (imagesData is String) {
        // Remove brackets and quotes, then split by comma
        String cleaned = imagesData
            .replaceAll('[', '')
            .replaceAll(']', '')
            .replaceAll("'", '')
            .replaceAll('"', '');

        return cleaned
            .split(',')
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty && e.startsWith('http'))
            .toList();
      } else if (imagesData is List) {
        return imagesData
            .map((e) => e.toString().trim())
            .where((e) => e.isNotEmpty && e.startsWith('http'))
            .toList();
      }

      return [];
    }

    return Product(
      uniqId: json['uniq_id'] ?? '',
      title: json['title'] ?? 'Untitled Product',
      price: json['price'] != null ? (json['price'] as num).toDouble() : null,
      available: json['available'] ?? false,
      color: json['color']?.toString().isEmpty == true ? null : json['color'],
      material: json['material']?.toString().isEmpty == true ? null : json['material'],
      manufacturer: json['manufacturer']?.toString().isEmpty == true ? null : json['manufacturer'],
      countryOfOrigin: json['country_of_origin']?.toString().isEmpty == true ? null : json['country_of_origin'],
      description: json['description']?.toString().isEmpty == true ? null : json['description'],
      images: parseImages(json['images']),
    );
  }

  String get primaryImage => images.isNotEmpty ? images[0] : '';

  bool get hasPrice => price != null && price! > 0;

  String get priceDisplay => hasPrice ? '\$${price!.toStringAsFixed(2)}' : 'Price unavailable';

  bool get isGreyedOut => !available || !hasPrice;
}