import 'dart:io';

void main() {
  int num;
  List valueList = [];
  bool status = true;
  String choice;

  while (status) {
    print("Enter value : ");
    num = int.parse(stdin.readLineSync()!);

    valueList.add(num);

    print(
      "Do you want to add more numbers press y for yes and press n for no : ",
    );
    choice = stdin.readLineSync()!;

    if (choice == 'n') {
      status = false;
    }
  }

  print(valueList);
}
