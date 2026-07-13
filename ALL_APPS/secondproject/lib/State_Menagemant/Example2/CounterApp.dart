import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  // variable .0bs  : observerable variable
  var counter = 0.obs;

  void incriment() {
    counter++;
  }

  void decriment() {
    counter--;
  }
}

class MyCounterApp extends StatelessWidget {
  CounterController counterController = CounterController();
  MyCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App"), backgroundColor: Colors.teal),
      body: Column(
        children: [
          Obx(() => Text("Counter : ${counterController.counter}")),

          ElevatedButton(
            onPressed: () {
              counterController.incriment();
            },
            child: Text("Incriment +"),
          ),

          ElevatedButton(
            onPressed: () {
              counterController.decriment();
            },
            child: Text("Decriment -"),
          ),
        ],
      ),
    );
  }
}
