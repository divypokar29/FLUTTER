import 'package:flutter/material.dart';

class listtileexample extends StatefulWidget {
  const listtileexample({super.key});

  @override
  State<listtileexample> createState() => _listtileexampleState();
}

class _listtileexampleState extends State<listtileexample> {
  String? Gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List tile Example"),
        backgroundColor: Colors.indigo[300],
      ),
      body: Column(
        children: [
          RadioListTile(
            tileColor: Colors.blue,
            title: Text("Male"),
            value: "Male",
            groupValue: Gender,
            onChanged: (value) {
              setState(() {
                Gender = value;
              });
            },
          ),
          RadioListTile(
            tileColor: Colors.pink,
            title: Text("Female"),
            value: "Female",
            groupValue: Gender,
            onChanged: (value) {
              setState(() {
                Gender = value;
              });
            },
          ),
          Gender != null
              ? Text(
                "${Gender}",
                style: TextStyle(fontSize: 36, color: Colors.black),
              )
              : SizedBox(),
        ],
      ),
    );
  }
}
