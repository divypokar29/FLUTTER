import 'dart:io';

void addition() {
  int num1, num2;
  int ans;

  print("Enter number 1 : ");
  num1 = int.parse(stdin.readLineSync()!);

  print("Enter number 2 : ");
  num2 = int.parse(stdin.readLineSync()!);

  ans = num1 + num2;

  print("ans = ${ans}");
}

void multiplication() {
  int num1, num2;
  int ans;

  print("Enter number 1 : ");
  num1 = int.parse(stdin.readLineSync()!);

  print("Enter number 2 : ");
  num2 = int.parse(stdin.readLineSync()!);

  ans = num1 * num2;

  print("ans = ${ans}");
}

void main() {
  int choice;

  String? menu = """
                  MENU 

          press 1 for addition
          press 2 for multiplication 
    """;

  print(menu);

  print("Enter your choice : ");
  choice = int.parse(stdin.readLineSync()!);

  switch (choice) {
    case 1:
      addition();
      break;

    case 2:
      multiplication();
      break;

    default:
      print("invalid input ");
  }
}
