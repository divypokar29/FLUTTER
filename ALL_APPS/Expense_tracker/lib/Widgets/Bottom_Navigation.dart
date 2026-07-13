import 'package:expense_tracker/Screens/Budget_screen.dart';
import 'package:expense_tracker/Screens/Deshbord_screen.dart';
import 'package:expense_tracker/Screens/More_Screen.dart';

import 'package:expense_tracker/Screens/Report_screen.dart';
import 'package:expense_tracker/Screens/Trangeaction_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int currentindex = 0;

  final List<Widget> pages = [
    Dashbordscreen(),
    TrangeactionScreen(),
    BudgetScreen(),
    ReportScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        onTap:
            (value) => setState(() {
              currentindex = value;
            }),
        iconSize: 30,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree_outlined),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart_outlined_outlined),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: ""),
        ],
      ),
    );
  }
}
