import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:secondproject/API_PARCING/Edit_update_student.dart';
import 'package:secondproject/API_PARCING/Models/NewStudentModel.dart';

class StuddentFechMockRecord extends StatefulWidget {
  const StuddentFechMockRecord({super.key});

  @override
  State<StuddentFechMockRecord> createState() => _StuddentFechMockRecordState();
}

class _StuddentFechMockRecordState extends State<StuddentFechMockRecord> {
  Future<List<Newstudentmodel>> fetchRecord() async {
    final response = await http.get(
      Uri.parse("https://6a4242447602860e65212943.mockapi.io/api/Student"),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);

      List<Newstudentmodel> postList =
          jsonList.map((jsonObj) => Newstudentmodel.fromJson(jsonObj)).toList();

      print("-------------->>>>>>> ${postList}");
      return postList;
    } else {
      throw Exception("Invalid url");
    }
  }

  Future<void> deleteRecord(String id) async {
    final response = await http.delete(
      Uri.parse(
        "https://6a4242447602860e65212943.mockapi.io/api/Student/${id}",
      ),
    );

    if (response.statusCode == 200) {
      StuddentFechMockRecord();
    } else {
      throw Exception("Not deleted");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fech List of Records "),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: FutureBuilder(
        future: fetchRecord(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Newstudentmodel> student = snapshot.data!;

            return ListView.builder(
              itemCount: student.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => EditUpdateStudent(
                                newstudentmodel: student[index],
                              ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 20,
                      child: Column(
                        children: [
                          Text("Tital : ${student[index].name}"),
                          Text("Body : ${student[index].email}"),
                          ElevatedButton.icon(
                            label: Text("Delete"),
                            onPressed: () {
                              setState(() {
                                deleteRecord(student[index].id.toString());
                              });
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
