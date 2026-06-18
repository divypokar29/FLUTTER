import 'package:flutter/material.dart';

class CheckBoxExample2 extends StatefulWidget {
  const CheckBoxExample2({super.key});

  @override
  State<CheckBoxExample2> createState() => _CheckBoxExample2State();
}

class _CheckBoxExample2State extends State<CheckBoxExample2> {
  bool chk_play = false;
  bool chk_read = false;

  List myfav = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check box List tile"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          CheckboxListTile(
            title: Text("Play"),

            value: chk_play,
            onChanged: (value) {
              setState(() {
                chk_play = value!;
                if (chk_play) {
                  myfav.add("Play");
                } else {
                  myfav.remove("Play");
                }
              });
            },
          ),
          CheckboxListTile(
            title: Text("Reading"),

            value: chk_read,
            onChanged: (value) {
              setState(() {
                chk_read = value!;
                if (chk_read) {
                  myfav.add("Reading");
                } else {
                  myfav.remove("Reading");
                }
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              print("-->${myfav}");
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
