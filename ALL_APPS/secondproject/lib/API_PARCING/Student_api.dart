import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:secondproject/API_PARCING/Models/PostModel.dart';
import 'package:secondproject/API_PARCING/Models/StudentData.dart';
import 'package:secondproject/SCAFFOLD_EXAMPLE/scaffold1.dart';

class StudentApi extends StatefulWidget {
  const StudentApi({super.key});

  @override
  State<StudentApi> createState() => _StudentApiState();
}

class _StudentApiState extends State<StudentApi> {
  Future<List<StudentModel>> fetchRecord() async {
    final response = await http.get(
      Uri.parse("https://6a3cfcf6d8e212699e233242.mockapi.io/student/student"),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);

      List<StudentModel> postList =
          jsonList.map((jsonObj) => StudentModel.fromJson(jsonObj)).toList();

      print("-------------->>>>>>> ${postList}");
      return postList;
    } else {  
      throw Exception("Invalid url");
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
            List<StudentModel> post = snapshot.data!;

            return ListView.builder(
              itemCount: post.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 20,
                    child: Column(
                      children: [
                        Text("ID : ${post[index].id}"),
                        Text("Subject : ${post[index].subject}"),
                        Text("Name : ${post[index].name}"),
                      ],
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
