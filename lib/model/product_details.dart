// To parse this JSON data, do
//
//     final productDetails = productDetailsFromJson(jsonString);

import 'dart:convert';

import 'package:apiexample/model/rating_details.dart';

ProductDetails productDetailsFromJson(String str) =>
    ProductDetails.fromJson(json.decode(str));

String productDetailsToJson(ProductDetails data) => json.encode(data.toJson());

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
