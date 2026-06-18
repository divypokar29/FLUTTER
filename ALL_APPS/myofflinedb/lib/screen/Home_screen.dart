import 'package:flutter/material.dart';
import 'package:myofflinedb/Models/Todo_models.dart';
import 'package:myofflinedb/database/Database_helper.dart';
import 'package:myofflinedb/screen/Add_page_screen.dart';
import 'package:myofflinedb/widgets/Todo_card.dart';

class TodoHomeScreen extends StatefulWidget {
  const TodoHomeScreen({super.key});

  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  DatabaseHelper _dbHelper = DatabaseHelper.instance;
  List<TodoModels> _todoList = [];

  Future<void> viewgetdata() async {
    final todo = await _dbHelper.getAllTodos();
    setState(() {
      _todoList = todo;
    });
    print("--->$_todoList");
  }

Future<void> deleteData(int id) async {
  await _dbHelper.deleteTodo(id);
  viewgetdata();
}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewgetdata();
  }

  @override
  // int Selectedindex = 0;
  // bool ischeck = false;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 62, 62, 62),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Center(
              child: Text(
                "𝐦𝐲 𝐭𝐚𝐬𝐤",
                style: TextStyle(
                  fontSize: 30,
                  color: const Color.fromARGB(255, 199, 197, 197),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todoList.length,
              itemBuilder:
                 (context, index) {
                   return Dismissible(
                    key: Key(_todoList[index].id.toString()),
                    direction: DismissDirection.startToEnd,
                    background: Container(color: const Color.fromARGB(255, 101, 101, 101)),
                    onDismissed: (direction) {
                      deleteData(_todoList[index].id!);
                      
                    },
                    child:  myTodoCard(
                    category: _todoList[index].category,
                    title: _todoList[index].title,
                    description: _todoList[index].description,
                    id: _todoList[index].id,
                    priority: _todoList[index].priority,
                    status: _todoList[index].status,
                    createdAt: _todoList[index].createdAt,
                    duedate: _todoList[index].duedate,
                  ),);
                 },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPageScreen()),
          );
        },
        elevation: 10,
        backgroundColor: const Color.fromARGB(255, 54, 31, 94),
        child: Icon(Icons.add, color: Colors.white),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: const Color.fromARGB(255, 58, 111, 105),
      //   unselectedItemColor: const Color.fromARGB(255, 188, 202, 201),
      //   selectedItemColor: const Color.fromARGB(255, 106, 255, 240),
      //   currentIndex: Selectedindex,
      //   iconSize: 20,
      //   selectedFontSize: 0,
      //   unselectedFontSize: 0,
      //   type: BottomNavigationBarType.fixed,
      //   onTap: (value) {
      //     setState(() {
      //       Selectedindex = value;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
      //     BottomNavigationBarItem(icon: Icon(Icons.date_range), label: ""),
      //     BottomNavigationBarItem(
      //       icon: CircleAvatar(
      //         child: IconButton(
      //           onPressed:
      //               () => Navigator.push(
      //                 context,
      //                 MaterialPageRoute(builder: (context) => AddTaskScreen()),
      //               ),
      //           icon: Icon(Icons.add, size: 25),
      //         ),
      //         backgroundColor: const Color.fromARGB(255, 150, 250, 240),
      //         maxRadius: 20,
      //       ),
      //       label: "",
      //     ),
      //     BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ""),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
      //   ],
      // ),
    );
  }
}
