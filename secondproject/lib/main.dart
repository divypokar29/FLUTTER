import 'package:flutter/material.dart';
import 'package:secondproject/LIST_EXAMPLE/List_BasicExample.dart';
import 'package:secondproject/LIST_EXAMPLE/List_add_data.dart';
import 'package:secondproject/LIST_EXAMPLE/Map_CrudOpration.dart';
import 'package:secondproject/LIST_EXAMPLE/Serche_example.dart';
import 'package:secondproject/TASK_KBC/Registration_Screen.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListAddData(),
    );
  }
}
