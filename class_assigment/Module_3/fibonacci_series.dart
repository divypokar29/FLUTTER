import 'dart:io';

void main() {
  int n, t1 = 0, t2 = 1, nextTerm;

  stdout.write("Enter the number: ");
  n = int.parse(stdin.readLineSync()!);

  print("Fibonacci Series: ");
  while (t1 <= n) {
    stdout.write("$t1 ");
    nextTerm = t1 + t2;
    t1 = t2;
    t2 = nextTerm;
  }
}
