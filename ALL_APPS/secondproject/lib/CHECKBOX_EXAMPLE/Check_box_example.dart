import 'package:flutter/material.dart';

class CheckBocExample extends StatefulWidget {
  const CheckBocExample({super.key});

  @override
  State<CheckBocExample> createState() => _CheckBocExampleState();
}

class _CheckBocExampleState extends State<CheckBocExample> {
  bool chk_c = false;
  bool chk_dart = false;
  bool chk_flutter = false;

  List myfavsubject = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check box"),
        backgroundColor: Colors.tealAccent,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text("C Programing"),
              Checkbox(
                value: chk_c,
                onChanged: (values) {
                  setState(() {
                    chk_c = values!;
                    if (chk_c) {
                      myfavsubject.add("C");
                    } else {
                      myfavsubject.remove("C");
                    }
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Text("Dart"),
              Checkbox(
                value: chk_dart,
                onChanged: (values) {
                  setState(() {
                    chk_dart = values!;
                    if (chk_dart) {
                      myfavsubject.add("Dart");
                    } else {
                      myfavsubject.remove("Dart");
                    }
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Text("Flutter"),
              Checkbox(
                value: chk_flutter,
                onChanged: (values) {
                  setState(() {
                    chk_flutter = values!;
                    if (chk_flutter) {
                      myfavsubject.add("Flutter");
                    } else {
                      myfavsubject.remove("Flutter");
                    }
                  });
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              print("------>$myfavsubject<-------");
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
