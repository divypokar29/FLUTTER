import 'dart:io';

void main() {
  print('========================================');
  print('         Even or Odd Checker            ');
  print('========================================\n');

  bool continueProgram = true;

  while (continueProgram) {
    stdout.write('Enter a number (or type "exit" to quit): ');
    String? input = stdin.readLineSync();

    if (input == null || input.trim().toLowerCase() == 'exit') {
      print('\nThank you for using the Even/Odd Checker. Goodbye!');
      break;
    }

    int? number = int.tryParse(input.trim());

    if (number == null) {
      print('Error: "$input" is not a valid integer. Please try again.\n');
      continue;
    }

    if (number % 2 == 0) {
      print('\n  ✔ $number is an EVEN number.\n');
    } else {
      print('\n  ✔ $number is an ODD number.\n');
    }

    print('----------------------------------------');
  }
}
