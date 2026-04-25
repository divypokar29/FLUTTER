import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Image_example extends StatelessWidget {
  const Image_example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Example"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        height: 300,
        width: 300,
        child: Image.network(
          "https://cdn.pixabay.com/photo/2015/10/01/17/17/car-967387_1280.png",
        ),
      ),
    );
  }
}
