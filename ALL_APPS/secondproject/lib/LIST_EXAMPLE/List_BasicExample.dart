import 'package:flutter/material.dart';

class MyListExample extends StatefulWidget {
  const MyListExample({super.key});

  @override
  State<MyListExample> createState() => _MyListExampleState();
}

class _MyListExampleState extends State<MyListExample> {
  List<String> subjectList = ["Python", "Java", "html", "CPP", "Flutter"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Example"), backgroundColor: Colors.teal),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListTile(
              tileColor: const Color.fromARGB(255, 71, 33, 104),
              leading: Icon(Icons.subject, color: Colors.white),
              title: Text(
                subjectList[0],
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListTile(
              tileColor: const Color.fromARGB(255, 71, 33, 104),
              leading: Icon(Icons.subject, color: Colors.white),
              title: Text(
                subjectList[1],
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
