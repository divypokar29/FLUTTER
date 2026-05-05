import 'package:flutter/material.dart';
import 'package:secondproject/TASK_KBC/Costom_widgets/Right_Qation_widget.dart';
import 'package:secondproject/TASK_KBC/Costom_widgets/Wrong_Anser.dart';

class QationsScreen extends StatefulWidget {
  const QationsScreen({super.key});

  @override
  State<QationsScreen> createState() => _QationsScreenState();
}

class _QationsScreenState extends State<QationsScreen> {
  String? mcq;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[100],
      appBar: AppBar(
        title: Center(
          child: Text(
            "K B C",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "(1) What is the capital of India?",
            style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          RadioListTile(
            title: Text("A) Mumbai", style: TextStyle(fontSize: 26)),
            value: "A",
            groupValue: mcq,
            onChanged: (value) {
              setState(() {
                mcq = value;
              });
            },
          ),
          SizedBox(height: 20),
          RadioListTile(
            title: Text("B) Delhi", style: TextStyle(fontSize: 26)),
            value: "B",
            groupValue: mcq,
            onChanged: (value) {
              setState(() {
                mcq = value;
              });
            },
          ),
          SizedBox(height: 20),
          RadioListTile(
            title: Text("C) Kolkata", style: TextStyle(fontSize: 26)),
            value: "C",
            groupValue: mcq,
            onChanged: (value) {
              setState(() {
                mcq = value;
              });
            },
          ),
          SizedBox(height: 20),
          RadioListTile(
            title: Text("D) Chennai", style: TextStyle(fontSize: 26)),
            value: "D",
            groupValue: mcq,
            onChanged: (value) {
              setState(() {
                mcq = value;
              });
            },
          ),
          SizedBox(height: 20),
          Container(
            height: 60,
            width: 120,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 2, 12, 65),
              ),
              onPressed: () {
                setState(() {
                  if (mcq == "B") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Winscreen()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WrongAnser()),
                    );
                  }
                });
              },
              child: Text("Next->", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
