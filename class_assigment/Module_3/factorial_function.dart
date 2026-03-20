import 'dart:io';

int findFactorial(int n) {
  int fact = 1;
  int i;
  for (i = 1; i <= n; i++) {
    fact = fact * i;
  }
  return fact;
}

void main() {
  int num, result;
  stdout.write("Enter a number: ");
  num = int.parse(stdin.readLineSync()!);

  result = findFactorial(num);
  print("Factorial of $num is: $result");
}
