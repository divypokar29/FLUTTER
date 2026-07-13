import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Bottomshettexample extends StatefulWidget {
  const Bottomshettexample({super.key});

  @override
  State<Bottomshettexample> createState() => _BottomshettexampleState();
}

class _BottomshettexampleState extends State<Bottomshettexample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Shett"), backgroundColor: Colors.teal),
      body: Container(
        child: ElevatedButton(
          onPressed: () {
            Get.bottomSheet(
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text("Select sn option"),
                    ListTile(
                      leading: Icon(Icons.edit),
                      title: Text("Edit Text"),
                    ),
                    ListTile(
                      leading: Icon(Icons.edit),
                      title: Text("Edit Text"),
                    ),
                  ],
                ),
              ),
            );
          },
          child: Text("open Bottom"),
        ),
      ),
    );
  }
}
