import 'package:flutter/material.dart';
import 'package:secondproject/BottomnavigationBar/Bottom_Example.dart';
import 'package:secondproject/BottomnavigationBar/Bottom_Example2.dart';
import 'package:secondproject/Food_orderApp/HomeScreen.dart';
import 'package:secondproject/LIST_EXAMPLE/List_BasicExample.dart';
import 'package:secondproject/LIST_EXAMPLE/List_add_data.dart';
import 'package:secondproject/LIST_EXAMPLE/Map_CrudOpration.dart';
import 'package:secondproject/LIST_EXAMPLE/Serche_example.dart';
import 'package:secondproject/Navigation_Drawer/Navigation_drawer_ex2.dart';
import 'package:secondproject/Navigation_Drawer/Navigtion_drawer_ex1.dart';
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
      home: NavigationDrawerEx2(),
    );
  }
}
