import 'package:flutter/material.dart';
import 'package:myofflinedb/Models/Todo_models.dart';
import 'package:myofflinedb/database/Database_helper.dart';
import 'package:myofflinedb/screen/Home_screen.dart';

class AddPageScreen extends StatefulWidget {
  const AddPageScreen({super.key});

  @override
  State<AddPageScreen> createState() => _AddPageScreenState();
}

class _AddPageScreenState extends State<AddPageScreen> {
  final formkey = GlobalKey<FormState>();

  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _descraptioncontroller = TextEditingController();
  TextEditingController _statuscontroller = TextEditingController();
  TextEditingController _prioritycontroller = TextEditingController();
  TextEditingController _categorycontroller = TextEditingController();
  TextEditingController _duedatecontroller = TextEditingController();

  Future<void> savData() async {
    if (formkey.currentState!.validate()) {
      final DatabaseHelper dbhelper = DatabaseHelper.instance;
      final data = TodoModels(
        title: _titlecontroller.text.toString(),
        description: _descraptioncontroller.text.toString(),
        category: _categorycontroller.text.toString(),
        status: _statuscontroller.text.toString(),
        priority: _prioritycontroller.text.toString(),
        duedate: _duedatecontroller.text.toString(),
        createdAt: DateTime.now().toIso8601String(),
      );

      await dbhelper.insertTodo(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 62, 62, 62),

      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),

                child: Center(
                  child: Text(
                    "Add ToDo",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _titlecontroller,
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 2, 32, 61),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Enter title",
                    labelText: "Title",
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (value) {
                    if (value!.length <= 0) {
                      return "title must be required";
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _descraptioncontroller,
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 2, 32, 61),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Enter Descraption",
                    labelText: "Descraption",
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (value) {
                    if (value!.length <= 0) {
                      return "Descraption must be required";
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _categorycontroller,
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 2, 32, 61),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Enter category",
                    labelText: "Category",
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (value) {
                    if (value!.length <= 0) {
                      return "Category must be required";
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _statuscontroller,
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 2, 32, 61),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Enter Status",
                    labelText: "Status",
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (value) {
                    if (value!.length <= 0) {
                      return "Status must be required";
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _prioritycontroller,
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 2, 32, 61),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Enter priority",
                    labelText: "Priority",
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (value) {
                    if (value!.length <= 0) {
                      return "Priority must be required";
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _duedatecontroller,
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 2, 32, 61),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Enter due date",
                    labelText: "Duedate",
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (value) {
                    if (value!.length <= 0) {
                      return "Duedate must be required";
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                   minimumSize: Size(200, 50)
                  ),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      savData();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TodoHomeScreen(),
                        ),
                      );
                    }
                  },
                  child: Text("Submit",style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
