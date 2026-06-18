import "package:flutter/material.dart";
import "package:secondproject/BottomnavigationBar/Contact_Screen.dart";
import "package:secondproject/BottomnavigationBar/Gallert_Screen.dart";
import "package:secondproject/BottomnavigationBar/Home_Screen.dart";
import "package:secondproject/BottomnavigationBar/Profile_Screen.dart";
import "package:secondproject/BottomnavigationBar/Setting_Screen.dart";

class BottomExample2 extends StatefulWidget {
  const BottomExample2({super.key});

  @override
  State<BottomExample2> createState() => _BottomExampleState2();
}

class _BottomExampleState2 extends State<BottomExample2> {
  List<Widget> pagelist = [
    HomeScreen(),
    SettingScreen(),
    ContactScreen(),
    ProfileScreen(),
    GallertScreen(),
  ];

  int Selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 99, 6, 116),
      appBar: AppBar(
        title: Center(
          child: Text("Instagaram", style: TextStyle(fontSize: 20)),
        ),
        backgroundColor: const Color.fromARGB(255, 227, 118, 204),
      ),
      body: Center(child: pagelist[Selectedindex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple,
        unselectedItemColor: Colors.blue,
        selectedItemColor: Colors.deepOrangeAccent,
        currentIndex: Selectedindex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            Selectedindex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts_outlined),
            label: "Contact",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: "Gallery"),
        ],
      ),
    );
  }
}
