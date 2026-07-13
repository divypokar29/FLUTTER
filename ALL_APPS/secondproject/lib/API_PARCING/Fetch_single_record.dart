import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:collection';

import 'package:secondproject/API_PARCING/Models/PostModel.dart';

class FetchSingleRecord extends StatelessWidget {
  const FetchSingleRecord({super.key});

  Future<Postmodel> fetchrecord() async {
    final respons = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
    );

    if (respons.statusCode == 200) {
      Map<String, dynamic> mapData = jsonDecode(respons.body);
      return Postmodel.fromJson(mapData);
    } else {
      throw Exception("somthing went wrong ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fech Single Record"),
        backgroundColor: Colors.deepPurple[300],
      ),
      body: FutureBuilder<Postmodel>(
        future: fetchrecord(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Postmodel post = snapshot.data!;
            return Column(
              children: [
                Text("Id : ${post.id}"),
                Text("Title : ${post.title}"),
                Text("Body : ${post.body}"),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
