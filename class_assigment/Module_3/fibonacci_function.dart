import 'dart:io';

void fibonacci(int n) {
  int t1 = 0, t2 = 1, nextTerm;

  stdout.write("Fibonacci Series: ");
  while (t1 <= n) {
    stdout.write("$t1 ");
    nextTerm = t1 + t2;
    t1 = t2;
    t2 = nextTerm;
  }
  print("");
}

void main() {
  int num;
  stdout.write("Enter a number: ");
  num = int.parse(stdin.readLineSync()!);

  fibonacci(num);
}
