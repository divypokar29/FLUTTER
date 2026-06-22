import 'package:expense_tracker/Database/Database_helper.dart';
import 'package:expense_tracker/Models/Transaction_model.dart';
import 'package:expense_tracker/Screens/Add_Expens.dart';
import 'package:expense_tracker/Widgets/Trangection_card.dart';
import 'package:flutter/material.dart';

class Dashbordscreen extends StatefulWidget {
  const Dashbordscreen({super.key});

  @override
  State<Dashbordscreen> createState() => _DashbordscreenState();
}

class _DashbordscreenState extends State<Dashbordscreen> {
  DatabaseHelper _dbhelper = DatabaseHelper.instance;
  List<TransactionModel> _trangectionList = [];

  Future<void> viewgetdata() async {
    final Trangections = await _dbhelper.getAllTransaction();
    setState(() {
      _trangectionList = Trangections;
    });
    print("--->$_trangectionList");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewgetdata();
  }

  @override
  int currentindex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8fafc),
      body: Column(
        children: [
          Container(
            color: Color(0xff10b981),
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    "Deshbord",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Total Balance",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    "₹ 45,680.50",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  color: Color(0xffffffff),
                  child: Container(
                    height: 120,
                    width: 180,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Income",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "₹ 72,450.00",
                            style: TextStyle(fontSize: 18, color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Color(0xffffffff),
                  child: Container(
                    height: 120,
                    width: 180,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Expense",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "₹ 26,450.00",
                            style: TextStyle(fontSize: 18, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  color: Color(0xffffffff),
                  child: Container(
                    height: 120,
                    width: 180,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Savings",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "₹ 20,450.00",
                            style: TextStyle(fontSize: 18, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Color(0xffffffff),
                  child: Container(
                    height: 120,
                    width: 180,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Budget",
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                " 68% ",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.orange,
                                ),
                              ),
                              Text(
                                "Used",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: const Color.fromARGB(
                                    255,
                                    135,
                                    134,
                                    134,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Transactions",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemBuilder:
                  (context, index) => TrangectionCard(
                    title: _trangectionList[index].title,
                    amount: _trangectionList[index].amount,
                    category: _trangectionList[index].category,
                    date: _trangectionList[index].date,
                    note: _trangectionList[index].note,
                    payment_method: _trangectionList[index].payment_method,
                  ),
              itemCount: _trangectionList.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.green,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddExpens()),
          );
          viewgetdata();  
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
