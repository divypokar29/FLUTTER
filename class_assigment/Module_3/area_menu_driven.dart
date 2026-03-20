import 'dart:io';
import 'dart:math';

void main() {
  int choice;
  double base, height, length, width, radius;

  print("1. Area of Triangle");
  print("2. Area of Rectangle");
  print("3. Area of Circle");
  stdout.write("Enter your choice: ");
  choice = int.parse(stdin.readLineSync()!);

  switch (choice) {
    case 1:
      stdout.write("Enter base: ");
      base = double.parse(stdin.readLineSync()!);
      stdout.write("Enter height: ");
      height = double.parse(stdin.readLineSync()!);
      print("Area of Triangle: ${0.5 * base * height}");
      break;
    case 2:
      stdout.write("Enter length: ");
      length = double.parse(stdin.readLineSync()!);
      stdout.write("Enter width: ");
      width = double.parse(stdin.readLineSync()!);
      print("Area of Rectangle: ${length * width}");
      break;
    case 3:
      stdout.write("Enter radius: ");
      radius = double.parse(stdin.readLineSync()!);
      print("Area of Circle: ${pi * radius * radius}");
      break;
    default:
      print("Invalid choice");
  }
}
