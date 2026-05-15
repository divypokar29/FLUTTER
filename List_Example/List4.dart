import 'dart:io';

void main() {
  List<int> numberList = [];

  int num;

  for (int i = 0; i <= 5; i++) {
    print("Enter a number :");
    num = int.parse(stdin.readLineSync()!);

    numberList.add(num);
  }
  print("Your numbers ");
  for (var number in numberList) {
    print(number);
  }
}
