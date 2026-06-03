import 'package:flutter/material.dart';

class TabbarEx2 extends StatefulWidget {
  const TabbarEx2({super.key});

  @override
  State<TabbarEx2> createState() => _TabbarEx2State();
}

class _TabbarEx2State extends State<TabbarEx2> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Whatsapp",
            style: TextStyle(color: Colors.green, fontSize: 25),
          ),
          bottom: TabBar(
            unselectedLabelStyle: TextStyle(color: Colors.white),
            tabs: [
              Tab(child: Text("Home"), icon: Icon(Icons.home)),
              Tab(child: Text("Contacts"), icon: Icon(Icons.phone)),
              Tab(child: Text("Profile"), icon: Icon(Icons.person)),
            ],
          ),
        ),
        body: TabBarView(children: [
          
          Center(child: Text("Home",style: TextStyle(fontSize: 30,color: Colors.red))),
          Center(child: Text("Contact",style: TextStyle(fontSize: 30,color: Colors.blue))),
          Center(child: Text("Profile",style: TextStyle(fontSize: 30,color: Colors.green)))
          
        ]),
      ),
    );
  }
}
