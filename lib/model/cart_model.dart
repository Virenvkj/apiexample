import 'package:apiexample/model/cart_products_model.dart';

class CartModel {
  final int id;
  final int userId;
  final List<CartProductsModel> products;

  CartModel({
    required this.id,
    required this.userId,
    required this.products,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        userId: json["userId"],
        products: List<CartProductsModel>.from(
            json["products"].map((x) => CartProductsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}
