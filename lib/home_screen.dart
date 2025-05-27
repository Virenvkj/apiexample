import 'dart:convert';

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
  ProductDetails? productDetails;

  Future<void> fetchProduct() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com//products/2'));
    productDetails = ProductDetails.fromJson(jsonDecode(response.body));

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (productDetails != null)
              ProductCard(productDetails: productDetails),
          ],
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
