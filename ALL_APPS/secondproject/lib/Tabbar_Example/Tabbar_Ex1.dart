import 'package:flutter/material.dart';

class TabbarEx1 extends StatefulWidget {
  const TabbarEx1({super.key});

  @override
  State<TabbarEx1> createState() => _TabbarEx1State();
}

class _TabbarEx1State extends State<TabbarEx1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Whatsapp",
          style: TextStyle(color: Colors.green, fontSize: 25),
        ),
        bottom: TabBar(tabs: [
          Tab(
            child: Text("Home"),
          ),
          Tab(
            child: Text("Contacts"),
          ),
          Tab(
            
            child: Text("Profile"),
          )
        ]),
      ),
    );
  }
}
