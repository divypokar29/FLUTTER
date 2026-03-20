import 'dart:io';

void main() {
  int n, sum = 0, m;

  stdout.write("Enter a number: ");
  n = int.parse(stdin.readLineSync()!);

  while (n > 0) {
    m = n % 10;
    sum = sum + m;
    n = n ~/ 10;
  }

  print("Sum is: $sum");
}
