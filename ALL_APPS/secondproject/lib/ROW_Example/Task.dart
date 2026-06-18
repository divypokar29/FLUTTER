import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TASK"), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 50,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5)),
                color: Colors.blue,
              ),
            ),
            Container(
              height: 50,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: const Color.fromARGB(255, 243, 33, 138),
              ),
            ),
            Container(
              height: 50,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: const Color.fromARGB(255, 79, 243, 33),
              ),
            ),
            Container(
              height: 50,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
                color: const Color.fromARGB(255, 12, 12, 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
