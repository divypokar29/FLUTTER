import 'dart:io';

void main() {
  int num;

  for (int i = 1; i <= 5; i++) {
    print("Enter a number : ");
    num = int.parse(stdin.readLineSync()!);

    if (num < 0) {
      break;
    }
  }
}
