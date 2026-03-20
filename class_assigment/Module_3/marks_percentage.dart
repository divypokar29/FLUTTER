import 'dart:io';

void main() {
  int m1, m2, m3, m4, m5, total;
  double percentage;

  stdout.write("Enter subject 1 mark: ");
  m1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter subject 2 mark: ");
  m2 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter subject 3 mark: ");
  m3 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter subject 4 mark: ");
  m4 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter subject 5 mark: ");
  m5 = int.parse(stdin.readLineSync()!);

  total = m1 + m2 + m3 + m4 + m5;
  percentage = total / 5;

  print("Total: $total");
  print("Percentage: $percentage");

  if (percentage > 75) {
    print("Distinction");
  } else if (percentage > 60 && percentage <= 75) {
    print("First class");
  } else if (percentage > 50 && percentage <= 60) {
    print("Second class");
  } else if (percentage > 35 && percentage <= 50) {
    print("Pass class");
  } else {
    print("Fail");
  }
}
