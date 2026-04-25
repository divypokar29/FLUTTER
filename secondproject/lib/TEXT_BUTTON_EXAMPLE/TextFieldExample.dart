import 'package:flutter/material.dart';

class Textfieldexample extends StatefulWidget {
  const Textfieldexample({super.key});

  @override
  State<Textfieldexample> createState() => _TextfieldexampleState();
}

class _TextfieldexampleState extends State<Textfieldexample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY TEXT FIELD"),
        backgroundColor: Colors.grey[200],
      ),
      body: Column(
        children: [
          Text("Student info", style: TextStyle(fontSize: 30)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter your name",
                label: Text("NAME"),
                icon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter your Subject",
                label: Text("Subject"),
                icon: Icon(Icons.book),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
