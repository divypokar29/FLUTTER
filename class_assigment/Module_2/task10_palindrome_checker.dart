import 'dart:io';

bool isPalindrome(String text) {
  String cleaned = text.replaceAll(' ', '').toLowerCase();
  String reversed = cleaned.split('').reversed.join('');
  return cleaned == reversed;
}

void main() {
  print('========================================');
  print('          Palindrome Checker            ');
  print('========================================\n');

  bool continueProgram = true;

  while (continueProgram) {
    stdout.write('Enter a string (or "exit" to quit): ');
    String? input = stdin.readLineSync();

    if (input == null || input.trim().toLowerCase() == 'exit') {
      print('\nGoodbye!');
      break;
    }

    if (input.trim().isEmpty) {
      print('Error: Input cannot be empty!\n');
      continue;
    }

    bool result = isPalindrome(input.trim());

    if (result) {
      print('\n  ✔ "$input" IS a palindrome!\n');
    } else {
      print('\n  ✘ "$input" is NOT a palindrome.\n');
    }

    String cleaned  = input.trim().replaceAll(' ', '').toLowerCase();
    String reversed = cleaned.split('').reversed.join('');
    print('  Original (cleaned) : $cleaned');
    print('  Reversed           : $reversed\n');

    print('----------------------------------------');
  }
}
