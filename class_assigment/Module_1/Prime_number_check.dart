import 'dart:io';

void main() {
  int num;

  print("Enter number :");

  num = int.parse(stdin.readLineSync()!);

  bool check = true;
  if (num <= 1) {
    check = false;
  } else {
    for (int i = 2; i < num; i++) {
      if (num % i == 0) {
        check = false;
        break;
      }
    }
  }

  if (check == true) {
    print("${num} is prime");
  } else {
    print("${num} is not Prime");
  }
}
