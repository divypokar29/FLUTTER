import 'dart:html_common';
import 'dart:io';

void main() {
  int rev;
  int num;

  print("Enter number :");
  num = int.parse(stdin.readLineSync()!);

  for (int i = 0; i <= 10; i++) {
    num = num ~/ 10;
  }
}
