import 'package:flutter/material.dart';
import 'package:myofflinedb/screen/Add_page_screen.dart';
import 'package:myofflinedb/screen/Home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: TodoHomeScreen(),
    );
  }
}
