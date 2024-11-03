// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Products {
  final String id;
  final String name;
  final String image;
  final int price;
  final String description;
  final int countInstock;

  Products({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.countInstock,

    
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'description': description,
      'countInstock': countInstock,
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      price: map['price'] ?? 0,
      description: map['description'] ?? '',
      countInstock: map['countInstock'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) => Products.fromMap(json.decode(source) as Map<String, dynamic>);
}

List<Products> listProducts = [];
