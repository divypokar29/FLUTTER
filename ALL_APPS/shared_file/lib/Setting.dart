import 'package:flutter/material.dart';
import 'package:shared_file/Dashbord_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
    super.initState();

    getThemstatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
        backgroundColor: const Color.fromARGB(255, 95, 60, 156),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Change theme"),
              Switch(
                value: themeColor,
                onChanged: (value) async {
                  setState(() {
                    themeColor = value;
                  });
                  final SharedPreferences _prefMain =
                      await SharedPreferences.getInstance();

                  if (themeColor == true) {
                    _prefMain.setBool("darkMode", true);
                  } else {
                    _prefMain.setBool("darkMode", false);
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashbordScreen()),
                  );
                },
              ),
            ],
          ),
          Text(
            "Current theme : ${themeColor ? "Dark Mode On" : "Light Mode on"}",
          ),
        ],
      ),
    );
  }
}
