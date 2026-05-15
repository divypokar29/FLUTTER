/*

if..else statement 

syntax : 

if (condition)
{
  true statement;
}
else
{
  false statement;
}

if part execute true statement and else part execute false statement
*/
import 'dart:io';

void main() {
  int age; // variable declaration

  print("Enter your age : ");
  age = int.parse(stdin.readLineSync()!);

  if (age >= 18) {
    print("you are eligible for votting !");
  } else {
    print("you are below 18");
  }
}
