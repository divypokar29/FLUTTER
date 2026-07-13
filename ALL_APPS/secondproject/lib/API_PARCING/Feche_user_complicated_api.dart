import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:secondproject/API_PARCING/Models/UserModel.dart';

class FecheUserComplicatedApi extends StatefulWidget {
  const FecheUserComplicatedApi({super.key});

  @override
  State<FecheUserComplicatedApi> createState() =>
      _FecheUserComplicatedApiState();
}

class _FecheUserComplicatedApiState extends State<FecheUserComplicatedApi> {
  Future<List<Usermodel>> fechrecord() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users"),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);

      List<Usermodel> userList =
          jsonList.map((jsonObj) => Usermodel.fromJson(jsonObj)).toList();

      return userList;
    } else {
      throw Exception("Invalid url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Data"),
        backgroundColor: Colors.lime[200],
      ),
      body: FutureBuilder(
        future: fechrecord(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Usermodel> user = snapshot.data!;

            return ListView.builder(
              itemCount: user.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 20,
                    child: Column(
                      children: [
                        Text("ID : ${user[index].id}"),
                        Text("Subject : ${user[index].name}"),
                        Text("userName : ${user[index].username}"),
                        Text("city : ${user[index].address.city}"),
                        Text("Company name : ${user[index].company.name}"),
                        Text("Lat : ${user[index].address.geo?.lat}"),
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
