import 'package:apiexample/core/api_requests.dart';
import 'package:apiexample/model/product_details.dart';
import 'package:apiexample/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductDetails> allProducts = [];

  Future<void> fetchProduct() async {
    final response = await http.get(Uri.parse(ApiRequests.allProducts));
    allProducts = productDetailsFromJson(response.body);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: allProducts.isEmpty
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemBuilder: (context, index) {
                  return ProductCard(
                    productDetails: allProducts[index],
                  );
                },
                itemCount: allProducts.length,
              ),
      ),
    );
  }
}
