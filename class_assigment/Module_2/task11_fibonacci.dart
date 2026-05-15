import 'dart:io';

int fibonacci(int n) {
  if (n == 0) return 0;
  if (n == 1) return 1;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

void main() {
  print('========================================');
  print('     Fibonacci Series Generator         ');
  print('========================================\n');

  stdout.write('Enter the number of terms to generate: ');
  String? input = stdin.readLineSync();

  int? terms = int.tryParse(input ?? '');

  if (terms == null || terms <= 0) {
    print('Error: Please enter a valid positive integer!');
    return;
  }

  print('\n  Fibonacci Series (first $terms terms):');
  print('  ----------------------------------------');

  stdout.write('  ');
  for (int i = 0; i < terms; i++) {
    stdout.write(fibonacci(i).toString());
    if (i < terms - 1) stdout.write(' , ');
  }

  print('\n');
  print('  Total terms generated: $terms');
  print('========================================');
}
