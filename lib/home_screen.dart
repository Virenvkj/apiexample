import 'package:apiexample/core/api_requests.dart';
import 'package:apiexample/model/product_details.dart';
import 'package:apiexample/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ProductDetails> allProducts = [];

  Future<void> fetchProduct() async {
    final response = await http.get(Uri.parse(ApiRequests.allProducts));
    allProducts = productDetailsFromJson(response.body);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: allProducts
                .map(
                  (product) => ProductCard(
                    productDetails: product,
                  ),
                )
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => fetchProduct(),
        tooltip: 'Fetch Products',
        child: const Icon(Icons.add),
      ),
    );
  }
}
