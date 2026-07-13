import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:secondproject/API_PARCING/Models/PhotoModel.dart';

class FechPicturesRecords extends StatefulWidget {
  const FechPicturesRecords({super.key});

  @override
  State<FechPicturesRecords> createState() => _FechPicturesRecordsState();
}

class _FechPicturesRecordsState extends State<FechPicturesRecords> {
  Future<List<Photomodel>> fetchPhotos() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/photos"),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<Photomodel> photoList =
          jsonData.map((json) => Photomodel.fromJson(json)).toList();

      return photoList;
    } else {
      throw Exception("invalid url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pictures"),
        backgroundColor: Colors.greenAccent,
      ),
      body: FutureBuilder(
        future: fetchPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Photomodel> photo = snapshot.data!;

            return ListView.builder(
              itemCount: photo.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(children: [Text("ID : ${photo[index].id}")]),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
