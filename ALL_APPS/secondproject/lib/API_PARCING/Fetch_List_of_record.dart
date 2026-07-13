import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:secondproject/API_PARCING/Models/PostModel.dart';
import 'package:secondproject/SCAFFOLD_EXAMPLE/scaffold1.dart';

class FetchListOfRecord extends StatefulWidget {
  const FetchListOfRecord({super.key});

  @override
  State<FetchListOfRecord> createState() => _FetchListOfRecordState();
}

class _FetchListOfRecordState extends State<FetchListOfRecord> {
  Future<List<Postmodel>> fetchRecord() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);

      List<Postmodel> postList =
          jsonList.map((jsonObj) => Postmodel.fromJson(jsonObj)).toList();

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
            List<Postmodel> post = snapshot.data!;

            return ListView.builder(
              itemCount: post.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 20,
                    child: Column(
                      children: [
                        Text("Tital : ${post[index].title}"),
                        Text("Body : ${post[index].body}"),
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
