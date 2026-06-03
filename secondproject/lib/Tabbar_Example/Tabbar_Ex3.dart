import 'package:flutter/material.dart';

class TabbarEx3 extends StatefulWidget {
  const TabbarEx3({super.key});

  @override
  State<TabbarEx3> createState() => _TabbarEx3State();
}

class _TabbarEx3State extends State<TabbarEx3> {
  PageController pageController = PageController();
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
        body: TabBarView(
          children: [
            PageView(
              controller: pageController,
              children: [
                Container(
                  child: Center(
                    child: Text(
                      "Home",
                      style: TextStyle(fontSize: 30, color: Colors.red),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Home",
                      style: TextStyle(fontSize: 30, color: Colors.red),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Home",
                      style: TextStyle(fontSize: 30, color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
            PageView(
              controller: pageController,
              children: [
                Container(
                  child: Center(
                    child: Text(
                      "Profile",
                      style: TextStyle(fontSize: 30, color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
            PageView(
              controller: pageController,
              children: [
                Container(
                  child: Center(
                    child: Text(
                      "Contact",
                      style: TextStyle(fontSize: 30, color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
