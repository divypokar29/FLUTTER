/*
nested if statement ::: 

if condition inside the another if statement its called nested if 

if (condition)
{
  statement
  if(condition)
  {
      statement
  }
}
else
{
  statement
}
*/
import 'dart:io';

void main() {
  int? marks;

  print("Enter your marks : ");
  marks = int.parse(stdin.readLineSync()!);

  if (marks >= 0 && marks <= 100) {
    if (marks >= 70) {
      print("A grade");
    } else if (marks >= 60 && marks < 70) {
      print("B grade");
    } else if (marks >= 50 && marks < 60) {
      print("C grade");
    } else if (marks >= 40 && marks < 50) {
      print("D grade");
    } else {
      print("Fail");
    }
  } else {
    print("Invalid Input !");
  }
}
