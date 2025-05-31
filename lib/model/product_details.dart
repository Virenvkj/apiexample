import 'dart:convert';

import 'package:apiexample/model/rating_details.dart';

class ProductDetails {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RaingDetails rating;

  ProductDetails({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: RaingDetails.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating.toJson(),
      };
}

// List<ProductDetails> productDetailsFromJson(String str) =>
//     List<ProductDetails>.from(
//       json.decode(str).map(
//             (x) => ProductDetails.fromJson(x),
//           ),
//     );

// List<ProductDetails> productDetailsFromJson(
//         List<dynamic> productListMap) =>
//     productListMap.map((e) => ProductDetails.fromJson(e)).toList();

// List<ProductDetails> productDetailsFromJson(
//         String str) =>
//     jsonDecode(str).map((e) => ProductDetails.fromJson(e)).toList();

List<ProductDetails> productDetailsFromJson(String str) =>
    List<ProductDetails>.from(
      jsonDecode(str).map(
        (x) => ProductDetails.fromJson(x),
      ),
    );
