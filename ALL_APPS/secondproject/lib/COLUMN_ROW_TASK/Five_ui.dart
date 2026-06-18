import 'package:flutter/material.dart';
import 'package:secondproject/SCAFFOLD_EXAMPLE/scaffold1.dart';

class FiveUi extends StatelessWidget {
  const FiveUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "FIFTH TASK",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 64, 180, 76),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  color: Colors.blue[300],
                  height: 60,
                  width: 480,

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "SECTION 2",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 120,
                    width: 100,
                    color: Colors.grey[300],
                    child: Center(child: Text("5")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 120,
                    width: 100,
                    color: Colors.grey[300],
                    child: Center(child: Text("6")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 120,
                    width: 100,
                    color: Colors.grey[300],
                    child: Center(child: Text("7")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 120,
                    width: 100,
                    color: Colors.grey[300],
                    child: Center(child: Text("8")),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Container(
                    height: 120,
                    width: 100,
                    color: Colors.grey[300],
                    child: Center(child: Text("9")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 120,
                    width: 100,
                    color: Colors.grey[300],
                    child: Center(child: Text("10")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 120,
                    width: 100,
                    color: Colors.grey[300],
                    child: Center(child: Text("11")),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  color: Colors.blue[300],
                  height: 60,
                  width: 480,

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "SECTION 3",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Container(
                    height: 120,
                    width: 100,
                    color: Colors.grey[300],
                    child: Center(child: Text("12")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 120,
                    width: 100,
                    color: Colors.grey[300],
                    child: Center(child: Text("13")),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
