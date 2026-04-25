import 'package:flutter/material.dart';

class Container4 extends StatelessWidget {
  const Container4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Container4"), backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
          alignment: Alignment.center,
          child: Container(
            height: 50,
            width: double.infinity,

            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
