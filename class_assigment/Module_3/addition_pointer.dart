import 'dart:io';

void add(int a, int b) {
  print("Addition is ${a + b}");
}

void main() {
  int a, b;
  stdout.write("Enter first number: ");
  a = int.parse(stdin.readLineSync()!);
  stdout.write("Enter second number: ");
  b = int.parse(stdin.readLineSync()!);

  // In Dart there are no pointers, so finding addition simply
  add(a, b);
}
