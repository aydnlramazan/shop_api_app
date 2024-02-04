import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shop_api_app/widgets/products_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List productList = [];
  @override
  void initState() {
    getProducts();
    super.initState();
  }

  void getProducts() async {
    Uri url = Uri.https("dummyjson.com", "products");
    final response = await http.get(url);
    final dataAsJson = json.decode(response.body);
    setState(() {
      productList = dataAsJson["products"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Shoping Fest",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // You can adjust the crossAxisCount as needed
          crossAxisSpacing: 8.0, // Add spacing between grid items
          mainAxisSpacing: 8.0, // Add spacing between grid items
        ),
        itemCount: productList.length,
        itemBuilder: (context, index) => ProductsWidget(
          imgUrl: productList[index]["thumbnail"],
          title: productList[index]["title"],
          price: productList[index]["price"].toString(),
        ),
      ),
    );
  }
}
