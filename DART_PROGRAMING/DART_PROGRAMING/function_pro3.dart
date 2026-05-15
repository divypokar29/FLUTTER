/*
function with parameters and function without return type 
*/
import 'dart:io';

void addition(int num1, int num2) {
  int ans = num1 + num2;
  print("ans = ${ans}");
}

void main() {
  int n1, n2;

  print("Enter number 1 : ");
  n1 = int.parse(stdin.readLineSync()!);

  print("Enter number 2 : ");
  n2 = int.parse(stdin.readLineSync()!);

  addition(n1, n2);

  
}
