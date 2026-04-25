import 'package:flutter/material.dart';
import 'package:secondproject/CARD_EXAMPLE/Card_example.dart';
import 'package:secondproject/COLUMN_EXAMPLE/Columne1.dart';
import 'package:secondproject/COLUMN_ROW_EXAMPLE/Column_row_example.dart';
import 'package:secondproject/COLUMN_ROW_TASK/First_ui.dart';
import 'package:secondproject/COLUMN_ROW_TASK/Five_ui.dart';
import 'package:secondproject/COLUMN_ROW_TASK/Fourth_ui.dart';
import 'package:secondproject/COLUMN_ROW_TASK/Second_ui.dart';
import 'package:secondproject/COLUMN_ROW_TASK/Therd_ui.dart';
import 'package:secondproject/CONTAINER/2.dart';
import 'package:secondproject/CONTAINER/Container_example.dart';
import 'package:secondproject/CONTAINER/Example4.dart';
import 'package:secondproject/GRADIENT_EXAMPLE/Lineargradiant_example.dart';
import 'package:secondproject/GRADIENT_EXAMPLE/RadiantGradiant_example.dart';
import 'package:secondproject/GRADIENT_EXAMPLE/SweepGradiant_Example.dart';
import 'package:secondproject/IMAGE_EXAMPLE/Network_example.dart';
import 'package:secondproject/ROW_Example/Row1.dart';
import 'package:secondproject/ROW_Example/Task.dart';
import 'package:secondproject/SCAFFOLD_EXAMPLE/appbarexample2.dart';
import 'package:secondproject/SCAFFOLD_EXAMPLE/appbarexample3.dart';
import 'package:secondproject/TEXT_BUTTON_EXAMPLE/TextFieldExample.dart';
import 'package:secondproject/TEXT_BUTTON_EXAMPLE/Text_button_1.dart';
import 'package:secondproject/TEXT_EXAMPLE/Textexample.dart';
import 'package:secondproject/UI/UI_Example2.dart';
import 'package:secondproject/UI/UI_example4.dart';


void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen2State());
  }
}
