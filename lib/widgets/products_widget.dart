import 'package:flutter/material.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget(
      {super.key,
      required this.imgUrl,
      required this.price,
      required this.title});

  final String imgUrl;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          imgUrl,
          width: 150,
          height: 150,
        ),
        Text(title),
        Text(price)
      ],
    );
  }
}
