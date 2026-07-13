import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:secondproject/API_PARCING/Models/CommentModel.dart';

class CommentsApi extends StatefulWidget {
  const CommentsApi({super.key});

  @override
  State<CommentsApi> createState() => _CommentsApiState();
}

class _CommentsApiState extends State<CommentsApi> {
  Future<List<Commentmodel>> fechcomments() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/comments"),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);

      List<Commentmodel> CommentList =
          jsonList.map((jsonObj) => Commentmodel.fromJson(jsonObj)).toList();

      return CommentList;
    } else {
      throw Exception("Invalid url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comment Records "),
        backgroundColor: Colors.deepOrange[300],
      ),
      body: FutureBuilder(
        future: fechcomments(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Commentmodel> Comment = snapshot.data!;

            return ListView.builder(
              itemCount: Comment.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Name : ${Comment[index].name}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Email : ${Comment[index].email}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Body : ${Comment[index].body}"),
                        ),
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
