//convert map data into json object
import 'dart:convert';

void main() {
  Map<String, dynamic> student = {
    'name': 'arav',
    'subjecct': 'python',
    'score': 89,
  };

  print("Map object : ${student}");

  // convert into json object

  print("JSON CONVERT : ${jsonEncode(student)}");
}
