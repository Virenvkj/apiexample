class CartProductsModel {
  final int productId;
  final int quantity;

  CartProductsModel({
    required this.productId,
    required this.quantity,
  });

  factory CartProductsModel.fromJson(Map<String, dynamic> json) =>
      CartProductsModel(
        productId: json["productId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
      };
}
