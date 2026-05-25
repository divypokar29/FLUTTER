import 'package:flutter/material.dart';

class Navigation_drawer_example extends StatefulWidget {
  const Navigation_drawer_example({super.key});

  @override
  State<Navigation_drawer_example> createState() =>
      _Navigation_drawer_exampleState();
}

class _Navigation_drawer_exampleState extends State<Navigation_drawer_example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drawer")),
      body: Container(child: Center(child: Text("Navigationdrawer"))),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(title: Text("Profile"),),
            ListTile(title: Text("Contacts"),),
            ListTile(title: Text("Settings"),),
            ListTile(title: Text("Logout"),),
          ],
        ),
      ),
    );
  }
}
