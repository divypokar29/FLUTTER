import 'dart:io';
import 'dart:math';

  
void main() {
  int choice = 2; 

  print("Enter a choice!!");
  choice=int.parse(stdin.readLineSync()!);
  if (choice == 1) {
    double b = 6, h = 4;
    print("Triangle Area: ${0.5 * b * h}");
  } else if (choice == 2) {
    double l = 8, w = 5;
    print("Rectangle Area: ${l * w}");
  } else if (choice == 3) {
    double r = 7;
    print("Circle Area: ${(pi*r*r).toStringAsFixed(2)}");
  } else {
    print("Invalid choice");
  }
}
