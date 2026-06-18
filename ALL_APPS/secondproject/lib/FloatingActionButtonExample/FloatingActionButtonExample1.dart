import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatefulWidget {
  const MyFloatingActionButton({super.key});

  @override
  State<MyFloatingActionButton> createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Floating Action Button")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Hello", style: TextStyle(fontSize: 36)),
            Text("Welcome to floating Button", style: TextStyle(fontSize: 36)),

            Text("Welcome to floating Button", style: TextStyle(fontSize: 36)),

            Text("Welcome to floating Button", style: TextStyle(fontSize: 36)),

            Text("Welcome to floating Button", style: TextStyle(fontSize: 36)),

            Text("Welcome to floating Button", style: TextStyle(fontSize: 36)),

            Text("Welcome to floating Button", style: TextStyle(fontSize: 36)),

            Text("Welcome to floating Button", style: TextStyle(fontSize: 36)),
            Text("Welcome to floating Button", style: TextStyle(fontSize: 36)),

            Text("Welcome to floating Button", style: TextStyle(fontSize: 36)),
            Text("Welcome to floating Button", style: TextStyle(fontSize: 36)),

            Text("Welcome to floating Button", style: TextStyle(fontSize: 36)),
            Text("Welcome to floating Button", style: TextStyle(fontSize: 36)),

            Text("Welcome to floating Button", style: TextStyle(fontSize: 36)),
            Text("Welcome to floating Button", style: TextStyle(fontSize: 36)),

            Text("Welcome to floating Button", style: TextStyle(fontSize: 36)),
            Text("Welcome to floating Button", style: TextStyle(fontSize: 36)),

            Text("Welcome to floating Button", style: TextStyle(fontSize: 36)),
            Text("Welcome to floating Button", style: TextStyle(fontSize: 36)),

            Text("Welcome to floating Button", style: TextStyle(fontSize: 36)),
            Text("Welcome to floating Button", style: TextStyle(fontSize: 36)),

            Text("Welcome to floating Button", style: TextStyle(fontSize: 36)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
