import 'dart:io';

BigInt factorial(int n) {
  if (n < 0) throw ArgumentError('Factorial is not defined for negative numbers.');
  if (n == 0 || n == 1) return BigInt.one;

  BigInt result = BigInt.one;
  for (int i = 2; i <= n; i++) {
    result *= BigInt.from(i);
  }
  return result;
}

void main() {
  print('========================================');
  print('        Factorial Calculator            ');
  print('========================================\n');

  bool continueProgram = true;

  while (continueProgram) {
    stdout.write('Enter a non-negative integer (or "exit" to quit): ');
    String? input = stdin.readLineSync();

    if (input == null || input.trim().toLowerCase() == 'exit') {
      print('\nGoodbye!');
      break;
    }

    int? number = int.tryParse(input.trim());

    if (number == null || number < 0) {
      print('Error: Please enter a valid non-negative integer!\n');
      continue;
    }

    BigInt result = factorial(number);

    print('\n  $number! = $result\n');
    print('----------------------------------------');
  }
}
