import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:secondproject/State_Menagemant/Example1/LoginScreen.dart';

class GEtScreen2 extends StatelessWidget {
  var data = Get.arguments;
  GEtScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Column(
        children: [
          Text("FName : ${data['fname']}"),
          Text("subject : ${data['subject']}"),
          Text("Score : ${data['score']}"),
          ElevatedButton(
            onPressed: () {
              Get.offAll(Loginscreen());
            },
            child: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
