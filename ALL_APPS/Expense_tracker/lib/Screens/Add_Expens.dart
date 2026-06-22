import 'package:expense_tracker/Database/Database_helper.dart'
    show DatabaseHelper;
import 'package:expense_tracker/Models/Transaction_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddExpens extends StatefulWidget {
  const AddExpens({super.key});

  @override
  State<AddExpens> createState() => _AddExpensState();
}

class _AddExpensState extends State<AddExpens> {
  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _categorycontroller = TextEditingController();
  TextEditingController _datecontroller = TextEditingController();
  TextEditingController _paymetcontroller = TextEditingController();
  TextEditingController _notecontroller = TextEditingController();

  String selectedCategory = "Food";
  final List<String> categoryList = [
    "Food",
    "Transport",
    "Bill",
    "Shoping",
    "Entertaiment",
    "other",
  ];

  Future<void> savData() async {
    if (_titlecontroller.text.isNotEmpty && _amountController.text.isNotEmpty) {
      final DatabaseHelper dbhelper = DatabaseHelper.instance;
      final data = TransactionModel(
        title: _titlecontroller.text.toString(),
        amount: double.parse(_amountController.text),
        date: _datecontroller.text.toString(),
        note: _notecontroller.text.toString(),
        payment_method: _paymetcontroller.text.toString(),
      );

      await dbhelper.insertTransaction(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Expense",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _titlecontroller,
                  decoration: InputDecoration(
                    labelText: "Title",
                    hintText: "Enter title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    labelText: "Amount",
            
                    hintText: "Enter Amount",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton<String>(
                    value: selectedCategory,
                    items:
                        categoryList.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _datecontroller,
                  decoration: InputDecoration(
                    labelText: "Date",
                    hintText: "Enter Date",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _paymetcontroller,
                  decoration: InputDecoration(
                    labelText: "Payment Meth",
                    hintText: "Enter category",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _notecontroller,
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: "Note",
                    hintText: "Enter Note",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(180, 60),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: Text("Cancel"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(180, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        savData();
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Save Expense",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
