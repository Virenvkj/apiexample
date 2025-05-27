import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? id;
  String? title;
  String? description;
  String? category;
  String? image;
  double? price;
  double? rate;
  int? count;

  Future<void> fetchProduct() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com//products/2'));
    final body = jsonDecode(response.body);
    id = body['id'];
    title = body['title'];
    description = body['description'];
    category = body['category'];
    image = body['image'];
    price = body['price'];
    rate = body['rating']['rate'];
    count = body['rating']['count'];
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
            Text('ID : $id'),
            Text('Title : $title'),
            Text('Description : $description'),
            Text('Category : $category'),
            if (image != null)
              Image.network(
                image!,
                height: 100,
                width: 100,
              ),
            Text('Price : $price'),
            Text('Rate : $rate'),
            Text('Count : $count'),
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
