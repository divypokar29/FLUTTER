import 'package:flutter/material.dart';

class TextButton1 extends StatefulWidget {
  const TextButton1({super.key});

  @override
  State<TextButton1> createState() => _TextButton1State();
}

class _TextButton1State extends State<TextButton1> {
  String number_value = "HELLO";
  double fontsize = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TEXT_BUTTON"),
        backgroundColor: Colors.brown[100],
      ),
      body: Center(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    fontsize += 2;
                  });
                },
                label: Text("Icrement"),
                icon: Icon(Icons.add),
              ),
              Text("${number_value}", style: TextStyle(fontSize: fontsize)),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    fontsize--;
                  });
                },
                label: Text("Decrement"),
                icon: Icon(Icons.remove),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
