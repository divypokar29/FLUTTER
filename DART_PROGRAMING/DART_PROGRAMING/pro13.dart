import 'dart:io';

void main() {
  int i, num, ans = 0;
  i = 1;
  while (i <= 5) {
    print("Enter number : ");
    num = int.parse(stdin.readLineSync()!);

    ans += num;

    print("ans = ${ans}");

    i++; // updation 
  }
}
