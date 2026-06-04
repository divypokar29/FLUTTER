import 'dart:io';

void main() {
  for (int i = 1; i <= 5; i++) {
    // spaces
    for (int j = i; j < 5; j++) {
      stdout.write(' ');
    }
    // stars
    for (int k = 1; k <= (2 * i - 1); k++) {
      stdout.write('*');
    }
    print('');
  }
}