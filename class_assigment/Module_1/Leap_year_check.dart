import 'dart:io';

void main() {
  print("Enter a year:");

  int year = int.parse(stdin.readLineSync()!);

  bool isLeap = (year % 4 == 0 && year % 100 != 0) ||
      (year % 400 == 0);

  if (isLeap) {
    print("$year is a Leap Year");
  } else {
    print("$year is NOT a Leap Year");
  }
}