import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_api_app/screens/detail_screen.dart';
import 'package:shop_api_app/widgets/products_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
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
    return GestureDetector(
      onTap: () {
        // Navigate to the new screen when tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(),
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Alışveriş Festivali",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
      ),
    );
  }
}
