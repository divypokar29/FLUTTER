import 'package:flutter/material.dart';
import 'package:secondproject/CHECKBOX_EXAMPLE/Check_box_example.dart';
import 'package:secondproject/CHECKBOX_EXAMPLE/Check_box_example2.dart';
import 'package:secondproject/COLUMN_ROW_TASK/First_ui.dart';
import 'package:secondproject/COLUMN_ROW_TASK/Five_ui.dart';
import 'package:secondproject/COLUMN_ROW_TASK/Fourth_ui.dart';
import 'package:secondproject/COLUMN_ROW_TASK/Second_ui.dart';
import 'package:secondproject/COLUMN_ROW_TASK/Therd_ui.dart';

import 'package:secondproject/FloatingActionButtonExample/FloatingActionButtonExample1.dart';
import 'package:secondproject/FloatingActionButtonExample/FloatingActionButtonExample2.dart';

import 'package:secondproject/Radio_Example/RadioListtile_example.dart';
import 'package:secondproject/SCAFFOLDMESSENGER/MESSENGER.dart';
import 'package:secondproject/TASK_KBC/Registration_Screen.dart'
    show RegistrationScreen;
import 'package:secondproject/UI/UI_Example2.dart';
import 'package:secondproject/UI/UI_Example3.dart';
import 'package:secondproject/UI/UI_example.dart' show Screen1;
import 'package:secondproject/UI/UI_example4.dart';
import 'package:secondproject/UI/UI_example5.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegistrationScreen(),
    );
  }
}
