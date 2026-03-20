import 'dart:io';

void main() {
  int num;
  int sqare, cube;

  print("Enter a number :");
  num = int.parse(stdin.readLineSync()!);

  sqare = num * num;
  cube = num * num * num;
  print("This is a your number sqare : ${sqare} and cube : ${cube}");
}
