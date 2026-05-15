// if statement

/*
when condition goes true it will execute true statement 
*/

import 'dart:io';

void main() {
  int age;

  print("Enter your age : ");
  age = int.parse(stdin.readLineSync()!);

  if (age >= 18) {
    print("you are eligible for votting");
  }
}
