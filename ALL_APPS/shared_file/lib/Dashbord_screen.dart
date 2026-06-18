import 'package:flutter/material.dart';
import 'package:shared_file/Setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashbordScreen extends StatefulWidget {
  const DashbordScreen({super.key});

  @override
  State<DashbordScreen> createState() => _DashbordScreenState();
}  

class _DashbordScreenState extends State<DashbordScreen> {
  Color darkColors = Colors.blue;
  Color lightColor = Colors.white;
  bool themeColor = false;

  Future<void> getThemstatus() async {
    SharedPreferences _prefMain = await SharedPreferences.getInstance();
    if (_prefMain.getBool("darkMode") == true) {
      setState(() {
        themeColor = _prefMain.getBool("darkMode") ?? false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getThemstatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor ? darkColors : lightColor,
      appBar: AppBar(title: Text("Dashbord"), backgroundColor: Colors.teal),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingScreen()),
          );

          getThemstatus();
        },
      ),
    );
  }
}
