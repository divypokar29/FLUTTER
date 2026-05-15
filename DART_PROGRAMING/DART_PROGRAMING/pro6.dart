/*
3) else if condition

when there is multiple condition in program its called 
else if condition 

syntax : 

if (condition)
{
  statement
}
else if (condition)
{
  statement
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
}
