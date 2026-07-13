import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dilogexampl extends StatelessWidget {
  const Dilogexampl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dilog Ex"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.defaultDialog(
              title: "Alert",
              middleText: "Are u shore tu delete",
              textConfirm: "Yes",

              confirmTextColor: Colors.green,
              
              onConfirm: () {
                Get.back();
                
              },
              onCancel: () {
                Get.back();
              },
            );
          },
          child: Text("Click to show dilog"),
        ),
      ),
    );
  }
}
