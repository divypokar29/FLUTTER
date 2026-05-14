import 'package:flutter/material.dart';
import 'package:secondproject/TASK_KBC/Qation_screen_2.dart';

class Winscreen extends StatefulWidget {
  const Winscreen({super.key});

  @override
  State<Winscreen> createState() => _WinscreenState();
}

class _WinscreenState extends State<Winscreen> {
  @override
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.emoji_events, color: Colors.amber, size: 100),

            SizedBox(height: 20),

            Text(
              "🎉 Congratulations 🎉",
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),

            SizedBox(height: 10),

            Text(
              "You won ₹1,00,000",
              style: TextStyle(fontSize: 22, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
