import 'package:get/state_manager.dart';

class TodoController extends GetxController {
  List<String> TodoList = <String>[].obs;

  void addTask(String TaskName) {
    if (TaskName.isNotEmpty) {
      TodoList.add(TaskName);
    }
  }

  void removeTask(int index) {
    TodoList.remove(index);
  }
}
