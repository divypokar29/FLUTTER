import 'package:expense_tracker/Database/Database_helper.dart'
    show DatabaseHelper;
import 'package:expense_tracker/Models/Trangeaction_model.dart';
import 'package:flutter/material.dart';

class UpdateTransaction extends StatefulWidget {
  const UpdateTransaction({super.key});

  @override
  State<UpdateTransaction> createState() => _UpdateTransactionState();
}

class _UpdateTransactionState extends State<UpdateTransaction> {
  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _datecontroller = TextEditingController();
  TextEditingController _paymetcontroller = TextEditingController();
  TextEditingController _notecontroller = TextEditingController();

  List<String> incomeCategories = [
    "Salary",
    "Business",
    "Freelancing",
    "Investment",
    "Bonus",
    "Other",
  ];

  List<String> expenseCategories = [
    "Food",
    "Shopping",
    "Bills",
    "Travel",
    "Healthcare",
    "Education",
    "Entertainment",
    "Other",
  ];
  String? selectedCategory = "Food";
  String? selectedType;

  Future<void> savData() async {
    if (_titlecontroller.text.isNotEmpty && _amountController.text.isNotEmpty) {
      final DatabaseHelper dbhelper = DatabaseHelper.instance;
      final data = TrangeactionModel(
        title: _titlecontroller.text.toString(),
        amount: double.parse(_amountController.text),
        type: selectedType,
        category: selectedCategory,
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Add Expense",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff10b981),
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
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedType,
                    decoration: InputDecoration(
                      labelText: selectedType ?? "Select Type",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(value: "Income", child: Text("Income")),
                      DropdownMenuItem(
                        value: "Expense",
                        child: Text("Expense"),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedType = value!;
                        selectedCategory = null;
                      });
                    },
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
                  child: DropdownButtonFormField<String>(
                    value: selectedCategory,
                    decoration: InputDecoration(
                      labelText: selectedCategory ?? "Category",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    items:
                        (selectedType == "Income"
                                ? incomeCategories
                                : expenseCategories)
                            .map((item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              );
                            })
                            .toList(),
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
                          side: BorderSide(color: Color(0xff10b981)),
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
