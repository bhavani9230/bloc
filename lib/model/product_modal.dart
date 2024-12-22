class ProductModal {
  final String id;
  final String image;
  final String name;
  final double price;

  ProductModal({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
  });

  // Method to convert a map into a ProductModal object
  // factory ProductModal.fromMap(Map<String, dynamic> map) {
  //   return ProductModal(
  //     id: map['id'] as String,
  //     image: map['image'] as String,
  //     name: map['name'] as String,
  //     price: (map['price'] as num).toDouble(),
  //   );
  // }

  // // Method to convert a ProductModal object into a map
  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'image': image,
  //     'name': name,
  //     'price': price,
  //   };
  // }
}
