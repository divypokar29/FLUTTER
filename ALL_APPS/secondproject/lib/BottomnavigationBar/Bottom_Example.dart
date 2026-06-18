import "package:flutter/material.dart";

class BottomExample extends StatefulWidget {
  const BottomExample({super.key});

  @override
  State<BottomExample> createState() => _BottomExampleState();
}

class _BottomExampleState extends State<BottomExample> {
  List<String> pagelist = ["HOME", "Setting", "Contact", "Profile", "Gallery"];

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
      body: Center(
        child: Container(
          child: Text(
            "${pagelist[Selectedindex]}",
            style: TextStyle(
              fontSize: 26,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
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
