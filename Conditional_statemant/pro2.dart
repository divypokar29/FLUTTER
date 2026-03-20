// if..else Statement

// syntax:

// if (condition) {
//      true statement;
// }
// else{
//   false statement;
// }

// if part exacute true statemant and else part execute false statement

import 'dart:io';

void main() {
  int age; // variable declaration

  print("Enter your age : ");
  age = int.parse(stdin.readLineSync()!);

  if (age >= 18) {
    print("you are aligible for voting!");
  } else {
    print("you are not aligible for voting!");
  }
}
