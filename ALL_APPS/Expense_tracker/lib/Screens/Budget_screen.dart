import 'package:expense_tracker/Database/Database_helper.dart';
import 'package:expense_tracker/Widgets/category_budget_section.dart';
import 'package:expense_tracker/Widgets/set_category_budget_dialog.dart';
import 'package:flutter/material.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  final DatabaseHelper _dbhelper = DatabaseHelper.instance;
  final TextEditingController _budgetController = TextEditingController();
  final GlobalKey<CategoryBudgetSectionState> _categoryKey =
      GlobalKey<CategoryBudgetSectionState>();

  double? _budget;
  double _totalIncome = 0.0;
  double _totalExpense = 0.0;
  double progress = 0;

  Future<void> savData() async {
    if (_budgetController.text.trim().isNotEmpty) {
      double budget = double.parse(_budgetController.text);
      await _dbhelper.insertBudget('Total', budget);
    }
  }

  Future<void> viewgetdata() async {
    final Budget = await _dbhelper.getBudget('Total');
    setState(() {
      _budget = Budget;
    });
    calculateProgress();
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
    super.initState();
    viewgetdata();
    showIncome();
    showExpense();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(color: Color(0xff10b981)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Monthly Budget",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _budgetController.text = (_budget ?? 0)
                              .toStringAsFixed(0);
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                backgroundColor: const Color(0xfff8fafc),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    height: 300,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Text(
                                          "Enter Your Monthly Budget",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        TextField(
                                          controller: _budgetController,
                                          decoration: InputDecoration(
                                            hintText: "Enter",
                                            labelText: "Budget",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () async {
                                            try {
                                              await savData();
                                              await viewgetdata();
                                              if (context.mounted)
                                                Navigator.of(context).pop();
                                            } catch (e) {
                                              print(e);
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            fixedSize: const Size(100, 40),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            backgroundColor: const Color(
                                              0xff10b981,
                                            ),
                                          ),
                                          child: const Text(
                                            "Save",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const Text("Edit"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: "₹ ${_totalExpense.toStringAsFixed(0)}",
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text: " / ",
                          style: TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 99, 99, 99),
                          ),
                        ),
                        TextSpan(
                          text: "₹ ${(_budget ?? 0).toStringAsFixed(0)}",
                          style: const TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 198, 198, 198),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    "${(progress * 100).round()}%",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const Text(
                    "Used",
                    style: TextStyle(color: Color.fromARGB(255, 85, 85, 85)),
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 15,
                      backgroundColor: Colors.grey.shade300,
                      valueColor: AlwaysStoppedAnimation(
                        progress < 0.5
                            ? Colors.blue
                            : progress < 0.8
                            ? Colors.orange
                            : Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        progress >= 0.8
                            ? Icons.warning_amber_rounded
                            : Icons.check_circle,
                        color: progress >= 0.8 ? Colors.orange : Colors.blue,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          progress >= 0.8
                              ? "You are approaching your budget limit!"
                              : "You are within your budget.",
                          style: TextStyle(
                            color:
                                progress >= 0.8 ? Colors.orange : Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
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
                  color: Theme.of(context).cardColor,
                  child: SizedBox(
                    height: 120,
                    width: 180,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Income",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "₹ $_totalIncome",
                            style: const TextStyle(
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
                  color: Theme.of(context).cardColor,
                  child: SizedBox(
                    height: 120,
                    width: 180,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Expense",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "₹ $_totalExpense",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 👇 NEW SECTION ADDED HERE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder:
                          (context) => SetCategoryBudgetDialog(
                            onSaved: () {
                              _categoryKey.currentState?.reload();
                            },
                          ),
                    );
                  },
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text("Set Category Budget"),
                ),
              ],
            ),
          ),
          CategoryBudgetSection(key: _categoryKey),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff10b981),
        onPressed: () {
          _budgetController.text = (_budget ?? 0).toStringAsFixed(0);
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                backgroundColor: const Color(0xfff8fafc),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Enter Your Monthly Budget",
                          style: TextStyle(fontSize: 18),
                        ),
                        TextField(
                          controller: _budgetController,
                          decoration: InputDecoration(
                            hintText: "Enter",
                            labelText: "Budget",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await savData();
                            await viewgetdata();
                            if (context.mounted) Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(100, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: const Color(0xff10b981),
                          ),
                          child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
