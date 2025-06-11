import 'dart:convert';
import 'package:apiexample/core/api_requests.dart';
import 'package:apiexample/core/auth_service.dart';
import 'package:apiexample/model/cart_model.dart';
import 'package:apiexample/utils/shared_prefs.dart';
import 'package:apiexample/widgets/basket_product_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartModel cartDetails;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchCartItems();
  }

  Future<void> fetchCartItems() async {
    setState(() {
      isLoading = true;
    });
    final userId = SharedPrefs.getIntValue(key: SharedPrefs.userIdKey);
    if (userId == null) {
      await AuthService.logoutUser(context);
      return;
    }
    final response =
        await http.get(Uri.parse('${ApiRequests.getCartItems}/$userId'));
    cartDetails = CartModel.fromJson(jsonDecode(response.body));

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: isLoading
            ? const Center(
                child: Text(
                  "Loading cart items...",
                  style: TextStyle(fontSize: 20),
                ),
              )
            : ListView.builder(
                itemCount: cartDetails.products.length,
                itemBuilder: (context, index) {
                  return BasketProductCard(
                    productId: cartDetails.products[index].productId,
                    quantity: cartDetails.products[index].quantity,
                  );
                },
              ));
  }
}
