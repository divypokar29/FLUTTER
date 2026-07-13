import 'package:expense_tracker/Database/Database_helper.dart';
import 'package:expense_tracker/Models/Trangeaction_model.dart';
import 'package:expense_tracker/Screens/Add_Trasaction.dart';
import 'package:expense_tracker/Widgets/Trangeaction_card.dart';
import 'package:flutter/material.dart';

class Dashbordscreen extends StatefulWidget {
  const Dashbordscreen({super.key});

  @override
  State<Dashbordscreen> createState() => _DashbordscreenState();
}

class _DashbordscreenState extends State<Dashbordscreen> {
  DatabaseHelper _dbhelper = DatabaseHelper.instance;
  List<TrangeactionModel> _trangectionList = [];

  double _totalIncome = 0.0;
  double _totalExpense = 0.0;
  double _totalBalance = 0.0;
  double progress = 0;
  double? _budget;

  Future<void> viewgetdata() async {
    final Trangections = await _dbhelper.getAllTransaction();
    setState(() {
      _trangectionList = Trangections;
    });
    print("--->$_trangectionList");
  }

  Future<void> showIncome() async {
    final income = await _dbhelper.getTotalIncome();

    setState(() {
      _totalIncome = income;
    });
  }

  Future<void> showExpense() async {
    final expense = await _dbhelper.getTotalExpense();

    setState(() {
      _totalExpense = expense;
    });
  }

  Future<void> deleteData(int id) async {
    await _dbhelper.deleteTransaction(id);
    viewgetdata();
  }

  Future<void> viewBudget() async {
    final Budget = await _dbhelper.getBudget('Total');
    setState(() {
      _budget = Budget;
    });
    calculateProgress();
  }

  void calculateProgress() {
    if (_budget != null && _budget! > 0) {
      progress = _totalExpense / _budget!;

      if (progress > 1) {
        progress = 1;
      }
    } else {
      progress = 0;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewgetdata();
    showIncome();
    showExpense();
  }

  Future<void> _refreshDashboard() async {
    await viewgetdata();
    await showIncome();
    await showExpense();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: RefreshIndicator(
        onRefresh: () => _refreshDashboard(),
        child: Column(
          children: [
            Container(
              color: Color(0xff10b981),
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
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
                      "₹ ${_totalIncome - _totalExpense}",
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
                              "₹  $_totalIncome",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                              ),
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
                              "₹ $_totalExpense",
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
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                              ),
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
                                  " ${(progress * 100).round()}% ",
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
                    (context, index) => Dismissible(
                      key: Key(_trangectionList[index].id.toString()),
                      direction: DismissDirection.startToEnd,
                      background: Container(
                        color: const Color.fromARGB(255, 101, 101, 101),
                      ),
                      onDismissed: (direction) {
                        deleteData(_trangectionList[index].id!);
                      },
                      child: TransactionCard(
                        title: _trangectionList[index].title,
                        amount: _trangectionList[index].amount,
                        type: _trangectionList[index].type,
                        category: _trangectionList[index].category,
                        date: _trangectionList[index].date,
                        note: _trangectionList[index].note,
                        payment_method: _trangectionList[index].payment_method,
                      ),
                    ),
                itemCount: _trangectionList.length,
              ),
            ),
            // pages[currentindex]
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff10b981),
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
