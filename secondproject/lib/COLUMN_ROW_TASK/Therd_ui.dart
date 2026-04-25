import 'package:flutter/material.dart';
import 'package:secondproject/SCAFFOLD_EXAMPLE/scaffold1.dart';

class TherdUi extends StatelessWidget {
  const TherdUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("THERD TASK"),
        backgroundColor: const Color.fromARGB(255, 62, 46, 90),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(height: 100, width: 100, color: Colors.red),
                  Container(height: 100, width: 100, color: Colors.blue),
                  Container(height: 100, width: 100, color: Colors.green),
                  Container(height: 100, width: 100, color: Colors.yellow),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(height: 100, width: 100, color: Colors.deepPurple),
                  Container(height: 100, width: 100, color: Colors.redAccent),
                  Container(height: 100, width: 100, color: Colors.greenAccent),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.deepOrangeAccent,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: const Color.fromARGB(255, 79, 64, 63),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: const Color.fromARGB(255, 61, 30, 52),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: const Color.fromARGB(255, 100, 68, 68),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: const Color.fromARGB(255, 77, 53, 105),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: const Color.fromARGB(255, 168, 56, 114),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: const Color.fromARGB(255, 219, 183, 90),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: const Color.fromARGB(255, 79, 19, 113),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: const Color.fromARGB(255, 117, 118, 177),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: const Color.fromARGB(255, 99, 69, 67),
                  ),
                  Container(height: 100, width: 100, color: Colors.pink),
                  Container(height: 100, width: 100, color: Colors.grey),
                  Container(height: 100, width: 100, color: Colors.brown),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(height: 100, width: 100, color: Colors.deepPurple),
                  Container(height: 100, width: 100, color: Colors.redAccent),
                  Container(height: 100, width: 100, color: Colors.greenAccent),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.deepOrangeAccent,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: const Color.fromARGB(255, 79, 64, 63),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: const Color.fromARGB(255, 61, 30, 52),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: const Color.fromARGB(255, 100, 68, 68),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: const Color.fromARGB(255, 77, 53, 105),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
