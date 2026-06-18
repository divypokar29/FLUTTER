import 'package:flutter/material.dart';
import 'package:secondproject/CONTAINER/container1.dart';

class Example1 extends StatefulWidget {
  const Example1({super.key});

  @override
  State<Example1> createState() => _Example1State();
}

class _Example1State extends State<Example1> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [MyContainer(), MyContainer()]);
  }
}
