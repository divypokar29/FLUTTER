import 'dart:io';

double add(double a, double b) => a + b;
double subtract(double a, double b) => a - b;
double multiply(double a, double b) => a * b;

double? divide(double a, double b) {
  if (b == 0) return null;
  return a / b;
}

void main() {
  print('========================================');
  print('          Basic Calculator              ');
  print('========================================\n');

  bool continueProgram = true;

  while (continueProgram) {
    print('Select operation:');
    print('  1. Addition       ( + )');
    print('  2. Subtraction    ( - )');
    print('  3. Multiplication ( × )');
    print('  4. Division       ( ÷ )');
    print('  5. Exit');
    stdout.write('\nEnter your choice (1-5): ');

    String? choice = stdin.readLineSync();

    if (choice == '5') {
      print('\nThank you for using the Calculator. Goodbye!');
      break;
    }

    if (!['1', '2', '3', '4'].contains(choice)) {
      print('Invalid choice! Please enter a number between 1 and 5.\n');
      continue;
    }

    stdout.write('Enter first number : ');
    double? num1 = double.tryParse(stdin.readLineSync() ?? '');
    if (num1 == null) {
      print('Error: Invalid number!\n');
      continue;
    }

    stdout.write('Enter second number: ');
    double? num2 = double.tryParse(stdin.readLineSync() ?? '');
    if (num2 == null) {
      print('Error: Invalid number!\n');
      continue;
    }

    double? result;
    String operator = '';

    switch (choice) {
      case '1':
        result   = add(num1, num2);
        operator = '+';
        break;
      case '2':
        result   = subtract(num1, num2);
        operator = '-';
        break;
      case '3':
        result   = multiply(num1, num2);
        operator = '×';
        break;
      case '4':
        result   = divide(num1, num2);
        operator = '÷';
        if (result == null) {
          print('\n  Error: Division by zero is not allowed!\n');
          print('----------------------------------------');
          continue;
        }
        break;
    }

    print('\n  $num1 $operator $num2 = ${result!.toStringAsFixed(4)}\n');
    print('----------------------------------------');
  }
}
