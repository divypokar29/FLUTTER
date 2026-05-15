void main() {
  print('========================================');
  print('            FizzBuzz Program            ');
  print('========================================\n');

  for (int i = 1; i <= 100; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
      print('$i → FizzBuzz');
    } else if (i % 3 == 0) {
      print('$i → Fizz');
    } else if (i % 5 == 0) {
      print('$i → Buzz');
    } else {
      print('$i');
    }
  }

  print('\n========================================');
  print('  FizzBuzz complete! (1 to 100)         ');
  print('========================================');
}
