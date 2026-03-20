import 'dart:io';

void main() {
  int num, i, flag = 0;
  stdout.write("Enter a number: ");
  num = int.parse(stdin.readLineSync()!);

  if (num == 0 || num == 1) {
    flag = 1;
  }

  for (i = 2; i <= num / 2; i++) {
    if (num % i == 0) {
      flag = 1;
      break;
    }
  }

  if (flag == 0) {
    print("$num is a prime number.");
  } else {
    print("$num is not a prime number.");
  }
}
