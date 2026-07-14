import 'dart:convert';

import 'package:student_menagement_system/Models/StudentMenaModel.dart';
import 'package:http/http.dart' as http;
import 'package:student_menagement_system/Screens/Home.dart';

class ApiService {
  Future<List<Studentmodel>> fechStudent() async {
    final response = await http.get(
      Uri.parse(
        "https://6a54e4c9e49d9eb2cc5545e3.mockapi.io/StudentData/student",
      ),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);

      List<Studentmodel> studentList = jsonList
          .map((jsonobj) => Studentmodel.fromJson(jsonobj))
          .toList();

      return studentList;
    } else {
      throw Exception("Invelid url");
    }
  }

  Future<Studentmodel> updateStudent(String id, Studentmodel student) async {
    final response = await http.put(
      Uri.parse(
        "https://6a54e4c9e49d9eb2cc5545e3.mockapi.io/StudentData/student/$id",
      ),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(student.toJson()),
    );

    if (response.statusCode == 200) {
      return Studentmodel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update student");
    }
  }

  Future<Studentmodel> addStudent(Studentmodel student) async {
    final response = await http.post(
      Uri.parse(
        "https://6a54e4c9e49d9eb2cc5545e3.mockapi.io/StudentData/student",
      ),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(student.toJson()),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return Studentmodel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to add student");
    }
  }

  Future<void> deleteStudent(String id) async {
    final response = await http.delete(
      Uri.parse(
        "https://6a54e4c9e49d9eb2cc5545e3.mockapi.io/StudentData/student/${id}",
      ),
    );

    if (response.statusCode == 200) {
      Homescreen();
    } else {
      throw Exception("NOT delete");
    }
  }
}
