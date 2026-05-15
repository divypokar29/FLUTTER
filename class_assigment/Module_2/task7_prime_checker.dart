import 'dart:io';

bool isPrime(int number) {
  if (number < 2) return false;
  if (number == 2) return true;
  if (number % 2 == 0) return false;

  for (int i = 3; i * i <= number; i += 2) {
    if (number % i == 0) return false;
  }

  return true;
}

void main() {
  print('========================================');
  print('         Prime Number Checker           ');
  print('========================================\n');

  bool continueProgram = true;

  while (continueProgram) {
    stdout.write('Enter a number (or type "exit" to quit): ');
    String? input = stdin.readLineSync();

    if (input == null || input.trim().toLowerCase() == 'exit') {
      print('\nGoodbye!');
      break;
    }

    int? number = int.tryParse(input.trim());

    if (number == null) {
      print('Error: "$input" is not a valid integer. Please try again.\n');
      continue;
    }

    if (isPrime(number)) {
      print('\n  ✔ $number is a PRIME number.\n');
    } else {
      print('\n  ✘ $number is NOT a prime number.\n');
    }

    print('----------------------------------------');
  }
}
