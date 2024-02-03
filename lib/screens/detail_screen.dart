import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:shop_api_app/widgets/detail_widget.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List productList = [];
  @override
  void initState() {
    showProduct();
    super.initState();
  }

  void showProduct() async {
    Uri url = Uri.https("dummyjson.com", "products/images");
    final response = await http.get(url);
    final dataAsJson = json.decode(response.body);
    setState(() {
      productList = dataAsJson["products/images"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ListView.builder(
            itemBuilder: (context, index) => DetailWidget(
                images: productList[index]["products/images"],
                title: productList[index]["title"]))
      ],
    ));
  }
}
