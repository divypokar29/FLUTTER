import 'package:flutter/material.dart';
import 'package:secondproject/Navigation/Navigation_screen_2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen 1 "), backgroundColor: Colors.blue),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Screen2()),
                );
              },
              child: Text("Go to next Screen "),
            ),
          ),
        ],
      ),
    );
  }
}
