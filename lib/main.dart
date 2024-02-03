import 'package:flutter/material.dart';
import 'package:shop_api_app/screens/products_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: ProductsScreen(),
      ),
    );
  }
}
