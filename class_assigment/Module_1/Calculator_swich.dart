import 'dart:io';
void main() {
  double a = 20, b = 4;
  int choice = 1; 
print("Enter a choice!!");
choice=int.parse(stdin.readLineSync()!);
  switch (choice) {
    case 1:
      print("Addition: ${a + b}"); break;
    case 2:
      print("Subtraction: ${a - b}"); break;
    case 3:
      print("Multiplication: ${a * b}"); break;
    case 4:
      if (b != 0) print("Division: ${a / b}");
      else print("Cannot divide by zero");
      break;
    default:
      print("Invalid choice");
  }
}