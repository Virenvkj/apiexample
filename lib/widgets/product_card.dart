import 'package:apiexample/model/product_details.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductDetails? productDetails;

  const ProductCard({
    super.key,
    this.productDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('ID : ${productDetails?.id}'),
            Text('Title : ${productDetails?.title}'),
            Text('Description : ${productDetails?.description}'),
            Text('Category : ${productDetails?.category}'),
            if (productDetails?.image != null)
              Image.network(
                productDetails!.image,
                height: 100,
                width: 100,
              ),
            Text('Price : ${productDetails?.price}'),
            Text('Rate : ${productDetails?.rating.rate}'),
            Text('Count :${productDetails?.rating.count}'),
          ],
        ),
      ),
    );
  }
}
