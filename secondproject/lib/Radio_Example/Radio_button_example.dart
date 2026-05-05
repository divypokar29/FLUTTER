import 'package:flutter/material.dart';

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  String? Gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio Exampple"),
        backgroundColor: Colors.purple[400],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text("Male"),

              Radio(
                value: "Male",
                groupValue: Gender,
                onChanged: (value) {
                  setState(() {
                    Gender = value;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Text("Female"),

              Radio(
                value: "Female",
                groupValue: Gender,
                onChanged: (value) {
                  setState(() {
                    Gender = value;
                  });
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              print("Gender = $Gender");
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
    ;
  }
}
