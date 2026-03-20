// if statemant

// when condition goes true it will execute true statemant

import 'dart:io';

void main() {
  int age;

  print("Enter your age : ");
  age = int.parse(stdin.readLineSync()!);

  if (age > 18) {
    print("You are aligable for voting");
  }
}
