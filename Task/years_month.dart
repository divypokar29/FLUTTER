import 'dart:io';

void main() {
  int year;
  int months;

  print("Enter years : ");
  year = int.parse(stdin.readLineSync()!);

  months = year * 12;

  print(months);
}
