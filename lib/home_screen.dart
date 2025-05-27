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
  int counter = 10;
  String imageUrl = '';

  Future<void> fetchImage() async {
    final http.Response response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
    final body = jsonDecode(response.body);
    imageUrl = body['message'];
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
            Text(
              imageUrl.isNotEmpty
                  ? "Here is your image"
                  : "Press the button to fetch an image",
            ),
            const SizedBox(
              height: 20,
            ),
            if (imageUrl.isNotEmpty) Image.network(imageUrl),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await fetchImage();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
