import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:secondproject/API_PARCING/Models/NewStudentModel.dart';
import 'package:http/http.dart' as http;

class InsertScreen extends StatefulWidget {
  const InsertScreen({super.key});

  @override
  State<InsertScreen> createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _idController = TextEditingController();

  Future<void> insertrecords(Newstudentmodel newstudentmodel) async {
    final response = await http.post(
      Uri.parse("https://6a4242447602860e65212943.mockapi.io/api/Student"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(newstudentmodel.toJson()),
    );
    // print(response.statusCode);
    //print(response.body);
  }

  bool _isloding = false;

  Future<void> recordinsert() async {
    setState(() {
      _isloding = true;
    });

    Newstudentmodel newstudentmodel = Newstudentmodel(
      name: _nameController.text.toString(),
      email: _emailController.text.toString(),
      subject: _subjectController.text.toString(),
      id: _idController.text.toString(),
    );

    await insertrecords(newstudentmodel);

    setState(() {
      _isloding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 196, 147, 255),
      appBar: AppBar(
        title: Text("Inser Data"),
        backgroundColor: Colors.deepPurple[300],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "Enter name",
                labelText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Enter Emmail",
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _subjectController,
              decoration: InputDecoration(
                hintText: "Enter subject",
                labelText: "Subject",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _idController,
              decoration: InputDecoration(
                hintText: "Enter Id",
                labelText: "Id",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(300, 50),
              backgroundColor: Colors.green,
            ),
            onPressed: () async {
              if (!_isloding) {
                await recordinsert();
              }
            },
            child: Text("Inser", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
