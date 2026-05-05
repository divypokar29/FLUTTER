import 'package:flutter/material.dart';
import 'package:secondproject/TASK_KBC/Qation_screen_2.dart';

class WrongAnser extends StatefulWidget {
  const WrongAnser({super.key});

  @override
  State<WrongAnser> createState() => _WrongAnserState();
}

class _WrongAnserState extends State<WrongAnser> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QationsScreen2()),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cancel, color: Colors.red, size: 100),

            SizedBox(height: 20),

            Text(
              "❌ Wrong Answer",
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),

            SizedBox(height: 10),

            Text(
              "Sorry, Better Luck Next Time",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
