import 'dart:io';

int reverseNumber(int num, int rev) {
  if (num == 0) {
    return rev;
  }
  return reverseNumber(num ~/ 10, rev * 10 + num % 10);
}

void main() {
  int num, rev;
  stdout.write("Enter a number: ");
  num = int.parse(stdin.readLineSync()!);

  rev = reverseNumber(num, 0);

  if (num == rev) {
    print("$num is a palindrome number.");
  } else {
    print("$num is not a palindrome number.");
  }
}
