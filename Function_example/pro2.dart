import 'dart:io';

void addition() {
  int num1, num2;
  int ans;

  print("Enter no one : ");
  num1 = int.parse(stdin.readLineSync()!);

  print("Enter no two : ");
  num2 = int.parse(stdin.readLineSync()!);

  ans = num1 + num2;

  print("The sum of $num1 and $num2 is $ans");
}

void sabstractio() {
  int num1, num2;
  int ans;

  print("Enter no one : ");
  num1 = int.parse(stdin.readLineSync()!);

  print("Enter no two : ");
  num2 = int.parse(stdin.readLineSync()!);

  ans = num1 - num2;

  print("The sum of $num1 and $num2 is $ans");
}

void main() {
  int choice;

  print(
    " menu\n press one for substraction\n press two for addition\n press three for multiplication\n press four for division",
  );
  choice = int.parse(stdin.readLineSync()!);

  switch (choice) {
    case 1:
      addition();
      break;

    case 2:
      sabstractio();
      break;

    default:
      print("Invalid choice");
  }
}
