import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secondproject/State_Menagemant/Example3/TodoController.dart';

class Todolistex extends StatelessWidget {
  TodoController todoController = Get.put(TodoController());
  TextEditingController _taskController = TextEditingController();
  Todolistex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ToDo"), backgroundColor: Colors.teal),
      body: Column(
        children: [
          TextField(
            controller: _taskController,
            decoration: InputDecoration(
              hintText: "Enter task",
              labelText: "Task",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              todoController.addTask(_taskController.text.toString());
            },
            child: Text("add"),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: todoController.TodoList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onLongPress: () {
                      todoController.removeTask(index);
                    },
                    child: Card(
                      elevation: 2,
                      child: Text("${todoController.TodoList[index]}"),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
