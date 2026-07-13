import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Theamexample extends StatelessWidget {
  const Theamexample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Theme Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.changeTheme(ThemeData.dark());
              },
              child: const Text("Dark Mode"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.changeTheme(ThemeData.light());
              },
              child: const Text("Light Mode"),
            ),
          ],
        ),
      ),
    );
  }
}
