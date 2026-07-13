import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:secondproject/API_PARCING/Models/NewStudentModel.dart';

class EditUpdateStudent extends StatefulWidget {
  Newstudentmodel newstudentmodel;

  EditUpdateStudent({super.key, required this.newstudentmodel});

  @override
  State<EditUpdateStudent> createState() => _EditUpdateStudentState();
}

class _EditUpdateStudentState extends State<EditUpdateStudent> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  Future<void> updateRecord() async {
    final response = await http.put(
      Uri.parse(
        "https://6a4242447602860e65212943.mockapi.io/api/Student/${widget.newstudentmodel.id}",
      ),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': _nameController.text.toString(),
        'email': _emailController.text.toString(),
      }),
    );

    if (response.statusCode == 200) {
      print("Update successfully");
    } else {
      throw Exception("Invalid input");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text = widget.newstudentmodel.name.toString();
    _emailController.text = widget.newstudentmodel.email.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data"),
        backgroundColor: Colors.deepPurple[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
                  hintText: "Enter Email",
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  updateRecord();
                  Navigator.pop(context);
                },
                child: Text("Edit", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
