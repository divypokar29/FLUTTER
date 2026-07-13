import 'package:expense_tracker/Database/Database_helper.dart';
import 'package:expense_tracker/Models/Trangeaction_model.dart';
import 'package:expense_tracker/Widgets/Trangeaction_card.dart';

import 'package:flutter/material.dart';

class TrangeactionScreen extends StatefulWidget {
  const TrangeactionScreen({super.key});

  @override
  State<TrangeactionScreen> createState() => _TrangeactionScreenState();
}

class _TrangeactionScreenState extends State<TrangeactionScreen> {
  int currentindex = 0;

  DatabaseHelper _dbhelper = DatabaseHelper.instance;
  List<TrangeactionModel> _trangectionList = [];

  Future<void> viewgetdata() async {
    final Trangections = await _dbhelper.getAllTransaction();
    setState(() {
      _trangectionList = Trangections;
    });
    print("--->$_trangectionList");
  }

  List<TrangeactionModel> get incomeList =>
      _trangectionList.where((item) => item.type == "Income").toList();

  List<TrangeactionModel> get expenseList =>
      _trangectionList.where((item) => item.type == "Expense").toList();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewgetdata();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Color(0xff10b981),
          title: Text("Transactions", style: TextStyle(color: Colors.white)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Material(
              color: Colors.white, // Background color of TabBar
              child: TabBar(
                labelColor: Colors.green,
                unselectedLabelColor: const Color.fromARGB(255, 114, 114, 114),
                indicatorColor: Colors.green,
                tabs: [
                  Tab(text: "All"),
                  Tab(text: "Income"),
                  Tab(text: "Expense"),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemBuilder:
                  (context, index) => TransactionCard(
                    title: _trangectionList[index].title,
                    amount: _trangectionList[index].amount,
                    type: _trangectionList[index].type,
                    category: _trangectionList[index].category,
                    date: _trangectionList[index].date,
                    note: _trangectionList[index].note,
                    payment_method: _trangectionList[index].payment_method,
                  ),
              itemCount: _trangectionList.length,
            ),
            ListView.builder(
              itemCount: incomeList.length,
              itemBuilder: (context, index) {
                final transaction = incomeList[index];

                return TransactionCard(
                  title: transaction.title,
                  amount: transaction.amount,
                  type: transaction.type,
                  category: transaction.category,
                  date: transaction.date,
                  note: transaction.note,
                  payment_method: transaction.payment_method,
                );
              },
            ),
            ListView.builder(
              itemBuilder:
                  (context, index) => TransactionCard(
                    title: expenseList[index].title,
                    amount: expenseList[index].amount,
                    type: expenseList[index].type,
                    category: expenseList[index].category,
                    date: expenseList[index].date,
                    note: expenseList[index].note,
                    payment_method: expenseList[index].payment_method,
                  ),
              itemCount: expenseList.length,
            ),
          ],
        ),
      ),
    );
  }
}
