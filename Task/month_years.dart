import 'dart:io';

void main() {
  int year;
  int months;

  print("Enter months : ");
  months = int.parse(stdin.readLineSync()!);

  year = months ~/ 12;

  print(year);
}
