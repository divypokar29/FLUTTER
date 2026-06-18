import "package:flutter/material.dart";
import "package:secondproject/Navigation/Screen2.dart";

class MyScreen1 extends StatefulWidget {
  const MyScreen1({super.key});

  @override
  State<MyScreen1> createState() => _MyScreen1State();
}

class _MyScreen1State extends State<MyScreen1> {
  TextEditingController _msgController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen1")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(controller: _msgController),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => MyScreen2(
                                message: _msgController.text.toString(),
                              ),
                        ),
                      );
                    },
                    child: Text("SEND"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
