import 'package:flutter/material.dart';

class ReverceNum extends StatefulWidget {
  const ReverceNum({super.key});

  @override
  State<ReverceNum> createState() => _ReverceNumState();
}

class _ReverceNumState extends State<ReverceNum> {
  @override
  String reversed = "";

  TextEditingController NumberController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reverce number"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged:
                  (value) => setState(() {
                    reversed = value.split('').reversed.join('');
                  }),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Text("Reverced : $reversed"),
        ],
      ),
    );
  }
}
