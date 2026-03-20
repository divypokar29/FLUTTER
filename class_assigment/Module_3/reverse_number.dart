import 'dart:io';

void main() {
  int n, reverse = 0, remainder;

  stdout.write("Enter an integer: ");
  n = int.parse(stdin.readLineSync()!);

  while (n != 0) {
    remainder = n % 10;
    reverse = reverse * 10 + remainder;
    n = n ~/ 10;
  }

  print("Reversed number: $reverse");
}
