import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget {
  DetailWidget({super.key, required this.images, required this.title});
  final String images;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [Image.network(images)],
      ),
    );
  }
}
