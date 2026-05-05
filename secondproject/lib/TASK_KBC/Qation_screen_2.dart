import 'package:flutter/material.dart';
import 'package:secondproject/TASK_KBC/Costom_widgets/Right_Qation_widget.dart';
import 'package:secondproject/TASK_KBC/Costom_widgets/Wrong_Anser.dart';

class QationsScreen2 extends StatefulWidget {
  const QationsScreen2({super.key});

  @override
  State<QationsScreen2> createState() => _QationsScreenState2();
}

class _QationsScreenState2 extends State<QationsScreen2> {
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "(2) Who is known as the Father of the Nation in India?",
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            RadioListTile(
              title: Text(
                "A) Jawaharlal Nehru",
                style: TextStyle(fontSize: 26),
              ),
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
              title: Text(
                "B) Subhash Chandra Bose",
                style: TextStyle(fontSize: 26),
              ),
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
              title: Text("C) Mahatma Gandhi", style: TextStyle(fontSize: 26)),
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
              title: Text("D) Bhagat Singh", style: TextStyle(fontSize: 26)),
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
                    if (mcq == "C") {
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
      ),
    );
  }
}
