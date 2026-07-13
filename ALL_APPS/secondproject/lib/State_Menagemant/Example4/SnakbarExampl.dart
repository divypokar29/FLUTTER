import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Snakbarexampl extends StatelessWidget {
  const Snakbarexampl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Snakbar Ex"), backgroundColor: Colors.cyan),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.snackbar(
              "Flutter",
              "Welcom to flutter",
              backgroundColor: Colors.cyan[200],
              duration: Duration(seconds: 3),
              snackPosition: SnackPosition.BOTTOM,
            );
          },
          child: Text("Show Snakbar"),
        ),
      ),
    );
  }
}
