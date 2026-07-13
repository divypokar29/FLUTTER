import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterCintroller extends GetxController {
  int Counter = 0;

  void increse() {
    Counter++;
    update();
  }

  void decrese() {
    Counter--;
    update();
  }
}

class CountersecondApp extends StatelessWidget {
  final CounterCintroller counter = Get.put(CounterCintroller());
  CountersecondApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        backgroundColor: Colors.amberAccent,
      ),
      body: GetBuilder<CounterCintroller>(
        builder: (controller) {
          return Center(child: Text("Counter value: ${counter.Counter}"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.increse();
        },
      ),
    );
  }
}
