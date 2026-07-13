import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:secondproject/State_Menagemant/Example1/Screen2.dart';

class GetScreen1 extends StatelessWidget {
  const GetScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX Navigation")),
      body: ElevatedButton(
        onPressed: () {
          Get.to(
            () => GEtScreen2(),
            arguments: {"fname": "Divy", "subject": "Flutter ", "score": 89},
          );
        },
        child: Text("enter"),
      ),
    );
  }
}
